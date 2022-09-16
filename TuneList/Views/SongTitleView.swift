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
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("**\(song.title ?? "Unknown Song")**")
                    .padding([.bottom, .trailing], 2)
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
                Image(systemName: "ellipsis")
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
        print("Song Details")
    }
    
    func openEditSongView() {
        isShowingEditSongView = true
        print("Song Info Editor")
    }
    
}
