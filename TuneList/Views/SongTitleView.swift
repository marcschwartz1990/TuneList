//
//  TuneTItleView.swift
//  TuneList
//
//  Created by Marc-Developer on 9/9/22.
//

import SwiftUI

struct SongTitleView: View {
    @ObservedObject var songs: Songs
    
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
                    openSongInfoEditor()
                }
                Button("Play Song") {
                    playSong()
                }
            } label: {
                Image(systemName: "ellipsis")
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
    
    func openSongInfoEditor() {
        print("Song Info Editor")
    }
}

struct SongTitleView_Previews: PreviewProvider {
    static var previews: some View {
        SongTitleView(songs: Songs(), song: Song(title: "Body and Soul", key: "Db", style: "Ballad"))
    }
}
