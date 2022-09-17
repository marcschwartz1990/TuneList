//
//  TuneTItleView.swift
//  TuneList
//
//  Created by Marc-Developer on 9/9/22.
//

import SwiftUI

struct SongTitleView: View {
    let song: Song
    
    @State private var isShowingEditSongView = false
    @State private var isShowingSongDetailView = false
    
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
                    openEditSongView()
                }
                
                Button("Play Song") {
                    playSong()
                }
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
//            .sheet(isPresented: $isShowingEditSongView) {
//                EditSongView(songs: Songs())
//            }
        }
        .padding()
    }
        
    
    func playSong() {
        print("Song being played")
    }
    
    func showSongDetailView() {
        isShowingSongDetailView = true
    }
    
    func openEditSongView() {
        isShowingEditSongView = true
        print("Song Info Editor")
    }
    
}
