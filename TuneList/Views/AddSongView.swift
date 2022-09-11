//
//  AddSongView.swift
//  TuneList
//
//  Created by Marc-Developer on 9/10/22.
//

import SwiftUI

struct AddSongView: View {
    @ObservedObject var songs: Songs
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var key = "C"
    @State private var style = ""
    
    let keys = ["Ab", "A", "Bb", "B", "C",
                "C#", "Db", "D", "Eb", "E",
                "F", "F#", "G"
               ]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Song Title", text: $title)
                    
                Picker("Key", selection: $key) {
                    ForEach(keys, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Style", text: $style)
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
