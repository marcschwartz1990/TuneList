//
//  SongInfoEditorView.swift
//  TuneList
//
//  Created by Marc-Developer on 9/9/22.
//

import SwiftUI

struct AddEditSongView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var key: String = "C Major"
    @State private var style: String = ""
    
    let navTitle: String
    let song: Song?
    let keys = Keys()
    let isNewSong: Bool
    
    init(song: Song?, isNewSong: Bool) {
        self.song = song
        self.isNewSong = isNewSong
        self.navTitle = (song != nil) == true ? "Edit Song" : "Add New Song"
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Song Title", text: $title)
                        .onAppear {
                            title = song?.title ?? ""
                            key = song?.key ?? "C Major"
                            style = song?.style ?? ""
                        }
                        
                    Picker("Key", selection: $key) {
                            Section {
                                ForEach(keys.majorKeys, id: \.self) {
                                    Text($0)
                                }
                            } header: {
                                Text("Major keys")
                            }
                            
                            Section {
                                ForEach(keys.minorKeys, id: \.self) {
                                    Text($0)
                                }
                            } header: {
                                Text("minor keys")
                            }
                    }

                    TextField("Style", text: $style)
                    
                } header: {
                    Text("Quick Reference Info")
                }
                
                Section {
                    Text("Placeholder: Lead Sheet Upload")
                    Text("Placeholder: Lyrics")
                    Text("Placeholder: Composer")
                    Text("Placeholder: Date Composed")
                    Text("ETC...")
                } header: {
                    Text("More Info")
                }
                
            }
            .navigationTitle(navTitle)
            .toolbar {
                Button("Save") {
                    saveSong()
                    dismiss()
                }
                // MARK: - BUG If I go to add view, type something in title, delete it, dismiss sheet, nothing works on the view before.
                
                .disabled(title.isEmpty)
            }
        }
    }
    
    func saveSong() {
        if isNewSong {
            let newSong = Song(context: moc)
            newSong.id = UUID()
            newSong.title = title
            newSong.key = key
            newSong.style = style
        } else {
            song?.title = title
            song?.key = key
            song?.style = style
        }
        
        try? moc.save()
        
        // MARK: - This will update the song in coreData but it will not show up in the quick reference view until it is reloaded. I must need to send it back to the view
    }
}

//struct AddEditSongView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddSongView()
//    }
//}
