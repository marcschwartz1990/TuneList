//
//  SongInfoEditorView.swift
//  TuneList
//
//  Created by Marc-Developer on 9/9/22.
//

import SwiftUI

struct AddSongView: View {
    @ObservedObject var songs: Songs
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var key = "C Major"
    @State private var style = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Song Title", text: $title)
                        
                    Picker("Key", selection: $key) {
                            Section {
                                ForEach(songs.majorKeys, id: \.self) {
                                    Text($0)
                                }
                            } header: {
                                Text("Major keys")
                            }
                            
                            Section {
                                ForEach(songs.minorKeys, id: \.self) {
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
                    let song = Song(title: title, key: key, style: style)
                    songs.songs.append(song)
                    dismiss()
                }
            }
        }
    }
}

struct AddSongView_Previews: PreviewProvider {
    static var previews: some View {
        AddSongView(songs: Songs())
    }
}
