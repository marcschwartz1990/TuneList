//
//  TuneTItleView.swift
//  TuneList
//
//  Created by Marc-Developer on 9/9/22.
//

import SwiftUI

struct SongTitleView: View {
    @ObservedObject var songs: Songs
    
    @State private var isShowingEditSongView = false
    
    var song: Song
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("**\(song.title)**")
                    .padding([.bottom, .trailing], 2)
                HStack {
                    Text("**Key**: \(song.key)")
                    Text("|")
                    Text("**Style**: \(song.style)")
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
            .sheet(isPresented: $isShowingEditSongView) {
                EditSongView(songs: Songs())
            }
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

struct SongTitleView_Previews: PreviewProvider {
    static var previews: some View {
        SongTitleView(songs: Songs(), song: Song(title: "Body and Soul", key: "Db", style: "Ballad"))
    }
}
