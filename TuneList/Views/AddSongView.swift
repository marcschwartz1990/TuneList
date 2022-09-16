//
//  SongInfoEditorView.swift
//  TuneList
//
//  Created by Marc-Developer on 9/9/22.
//

import SwiftUI

struct AddSongView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var key = "C Major"
    @State private var style = ""
    
    let majorKeys = ["Ab Major", "A Major", "Bb Major", "B Major", "C Major",
                    "C# Major", "Db Major", "D Major", "Eb Major", "E Major",
                    "F Major", "F# Major", "G Major"
                   ]
    
    let minorKeys = ["Ab minor", "A minor",
                     "Bb minor", "B minor", "C minor", "C# minor", "Db minor",
                     "D minor", "Eb minor", "E minor", "F minor", "F# minor", "G minor"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Song Title", text: $title)
                        
                    Picker("Key", selection: $key) {
                            Section {
                                ForEach(majorKeys, id: \.self) {
                                    Text($0)
                                }
                            } header: {
                                Text("Major keys")
                            }
                            
                            Section {
                                ForEach(minorKeys, id: \.self) {
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
            .navigationTitle("Add New Song")
            .toolbar {
                Button("Save") {
                    let newSong = Song(context: moc)
                    newSong.id = UUID()
                    newSong.title = title
                    newSong.key = key
                    newSong.style = style
                    
                    try? moc.save()
                    dismiss()
                }
            }
        }
    }
}

struct AddSongView_Previews: PreviewProvider {
    static var previews: some View {
        AddSongView()
    }
}
