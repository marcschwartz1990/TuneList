//
//  SongIndexView.swift
//  TuneList
//
//  Created by Marc Schwartz on 9/11/22.
//

import SwiftUI

struct SongIndexView: View {
    @StateObject var songs = Songs()
    @State private var showingAddSong = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(songs.songs.count) Songs in Index")
                
            List {
                ForEach(songs.songs) { song in
                    Text("\(song.title)")
                    
                }
                .onDelete(perform: songs.removeSongs)
                .onMove(perform: songs.moveSongs)
            }
            .navigationTitle("Song Index")
            .toolbar {
                HStack {
                    EditButton()
                    Button {
                        showingAddSong = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddSong) {
                AddSongView(songs: songs)
            }
            }
        }
    }
}

struct SongIndexView_Previews: PreviewProvider {
    static var previews: some View {
        SongIndexView()
    }
}
