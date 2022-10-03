//
//  SongDetailView.swift
//  TuneList
//
//  Created by Marc-Developer on 9/16/22.
//

import SwiftUI

struct SongDetailView: View {
    let song: Song
    @State private var trackObject: TrackObject? = TrackObject(track: Track(commontrackID: -1, hasLyrics: -1, trackName: "Sample", albumName: "Sample", artistName: "Sample"))
    
    @State private var showLyricSearch = false
    @State private var hasLyrics = false
    
    var body: some View {
        VStack {
            Text(song.wrappedTitle)
                .lineLimit(1)
                .allowsTightening(true)
                .minimumScaleFactor(0.5)
                .font(.custom("Georgia", size: 36))
                .font(.largeTitle)
                .padding([.top, .bottom])
            
            
            Group {
                HStack {
                    HStack {
                        Text("Key:")
                            .foregroundColor(.secondary)
                        Text(song.wrappedKey)
                    }
                    
                    Text("|")
                    
                    HStack {
                        Text("Style:")
                            .foregroundColor(.secondary)
                        Text(song.wrappedStyle)
                            
                    }
                }
                
                Divider()
                
                VStack {
                    VStack {
                        Text("Composed By")
                            .foregroundColor(.secondary)
                        Text(song.wrappedComposer)
                    }
                    .padding(.bottom)
                    
                    VStack {
                        Text("Year Composed")
                            .foregroundColor(.secondary)
                        Text(song.wrappedYearComposed)
                    }
                    .padding(.bottom)
                }
                .padding()
            }
            .font(.custom("Georgia", size: 16))
            
            Spacer()
            
            Divider()
            
            Button("Find Lyrics") {
                showLyricSearch = true
            }
            .buttonStyle(.bordered)
            .padding()
            Text(song.wrappedLyrics)
        }
        .padding()
        .sheet(isPresented: $showLyricSearch) {
            if hasLyrics {
                LyricsView(song: trackObject)
            } else {
                SongLyricSearchView()
            }
        }
    }
}

//struct SongDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        SongDetailView(song: Song(context: moc))
//    }
//}
