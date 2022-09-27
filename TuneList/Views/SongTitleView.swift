//
//  TuneTItleView.swift
//  TuneList
//
//  Created by Marc-Developer on 9/9/22.
//

import SwiftUI

struct SongTitleView: View {
    @ObservedObject var song: Song
    
    @State private var isShowingSongDetailView = false
    @State private var isShowingAddEditSongView = false
    
    init(song: Song) {
        self.song = song
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("**\(song.title ?? "Unknown Song")**")
                    .padding([.bottom, .trailing], 1)
                HStack {
                    Text("**Key**: \(song.key ?? "Unknown Key")")
                    Text("|")
                    Text("**Style**: \(song.style ?? "Unknown Style")")
                }
                .font(.caption)
            }
            
            Spacer()
            
            Menu {
                Button("Song Details") {
                    showSongDetailView()
                }
                
                Button("Edit Song Info") {
                    showAddEditSongView()
                }
                
                Button("Play Song") {
                    playSong()
                }
                
                Button("Add to Setlist") { }
                
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 28, height: 28)
                        .foregroundColor(.gray.opacity(0.5))
                    
                    Image(systemName: "ellipsis")
                        .font(.headline)
                }
            }
            .sheet(isPresented: $isShowingSongDetailView) {
                SongDetailView(song: song)
            }
            .sheet(isPresented: $isShowingAddEditSongView) {
                AddEditSongView(song: song, isNewSong: false)
            }
        }
        .padding()
    }
        
    
    func playSong() {
        print("Song being played")
    }
    
    func showSongDetailView() {
        isShowingSongDetailView = true
    }
    
    func showAddEditSongView() {
        isShowingAddEditSongView = true
    }
    
}
