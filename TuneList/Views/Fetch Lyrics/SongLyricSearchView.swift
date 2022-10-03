//
//  TESTSongLyricSearchView.swift
//  TuneList
//
//  Created by Marc-Developer on 9/28/22.
//

import SwiftUI



struct SongLyricSearchView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var trackInfo: TrackInfo? = nil
    @State private var trackList = [TrackObject]()
    
    @State private var searchTerm: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text(searchTerm)
                List(trackList, id: \.track.commontrackID) { song in
                   NavigationLink {
                       LyricsView(song: song)
                    } label: {
                        VStack(alignment: .leading) {
                            // When view is clicked, Lyrics should populate in a lyric view.
                            Text(song.track.trackName)
                            Text(song.track.albumName)
                            Text(song.track.artistName)
                            Text(String(song.track.hasLyrics))
                        }
                    }
                }
            }
            .navigationTitle("Search for Lyrics")
        }
        .searchable(text: $searchTerm)
        .onChange(of: searchTerm) { value in
            Task {
                if value.count > 3 {
                    await loadTrackInfo()
                    print(trackList)
                }
            }
        }
    }
    
    func loadTrackInfo() async {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.musixmatch.com"
        components.path = "/ws/1.1/track.search"
        components.queryItems = [
            URLQueryItem(name: "apikey", value: "1413cb34fe92193ceb16e1832d1b9bf8"),
            URLQueryItem(name: "q", value: searchTerm)
        ]
        
//        URL(string: "https://api.musixmatch.com/ws/1.1/track.search?q_track=things%20you%20are&apikey=1413cb34fe92193ceb16e1832d1b9bf8")
        
        guard let url = components.url else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(TrackInfo.self, from: data) {
                trackInfo = decodedResponse
                trackList = decodedResponse.message.body.trackList
            }
        } catch {
            print("Invalid Data")
        }
    }
}


//struct SongLyricSearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        @State private var lyrics = "Sample Lyrics"
//        
//        SongLyricSearchView(lyrics: $lyrics)
//    }
//}
