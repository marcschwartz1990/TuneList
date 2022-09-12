//
//  QuickReferencerView.swift
//  TuneList
//
//  Created by Marc-Developer on 9/8/22.
//

import SwiftUI

struct QuickReferenceView: View {
    @StateObject var songs = Songs()
    @State private var showingsAddSong = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(songs.songs) { song in
                    SongTitleView(songs: songs, song: song)
                }
                .onDelete(perform: songs.removeSongs)
                .onMove(perform: songs.moveSongs)
            }
            .navigationTitle("Quick Reference")
            .toolbar {
                HStack {
                    Button {
                        print("Sort by Button Pressed")
                    } label: {
                        Text("Sort by")
                    }
                    
                    EditButton()
                    
                    Button {
                        showingsAddSong = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingsAddSong) {
                AddSongView(songs: songs)
            }
        }
    }
}

struct QuickReferenceView_Previews: PreviewProvider {
    static var previews: some View {
        QuickReferenceView()
    }
}
