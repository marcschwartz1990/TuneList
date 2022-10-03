//
//  TestLyricsView.swift
//  TuneList
//
//  Created by Marc-Developer on 9/28/22.
//

import SwiftUI

struct LyricsView: View {
    let song: TrackObject?
    
    @State private var songLyrics: SongLyrics? = nil
    @State private var lyrics = ""
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text(lyrics)
                }
                
                VStack {
                    Button("Save") {
                        print("Save Button Pressed")
                    }
                }
                .navigationTitle(song!.track.trackName)
            }
        }
        .task {
            await loadLyrics(commontrackID: String(song!.track.commontrackID))
        }

    }
    
    func loadLyrics(commontrackID: String) async {
        guard let url = URL(string: "https://api.musixmatch.com/ws/1.1/track.lyrics.get?commontrack_id=\(commontrackID)&apikey=1413cb34fe92193ceb16e1832d1b9bf8") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(SongLyrics.self, from: data) {
                songLyrics = decodedResponse
                lyrics = songLyrics!.message.body.lyrics.lyricsBody
            }
        } catch {
            print("Invalid Data")
        }
        print(lyrics)
    }
}

//struct TESTLyricsView_Previews: PreviewProvider {
//    static var previews: some View {
//        LyricsView()
//    }
//}
