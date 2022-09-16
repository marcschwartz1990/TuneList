//
//  Songs.swift
//  TuneList
//
//  Created by Marc-Developer on 9/10/22.
//

import Foundation

class Songs: ObservableObject {
    @Published var songs = [Song]() {
        didSet {
            // didSet executes the below code as soon as the property Songs.songs changes
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(songs) {
                UserDefaults.standard.set(encoded, forKey: "Songs")
            }
        }
    }
    
    init() {
        if let savedSongs = UserDefaults.standard.data(forKey: "Songs") {
            if let decodedSongs = try? JSONDecoder().decode([Song].self, from: savedSongs) {
                songs = decodedSongs
                return
            }
        }
        
        songs = []
    }
    
    let majorKeys = ["Ab Major", "A Major", "Bb Major", "B Major", "C Major",
                "C# Major", "Db Major", "D Major", "Eb Major", "E Major",
                "F Major", "F# Major", "G Major"
               ]
    
    let minorKeys = ["Ab minor", "A minor",
                     "Bb minor", "B minor", "C minor", "C# minor", "Db minor",
                     "D minor", "Eb minor", "E minor", "F minor", "F# minor", "G minor"]
    
    // Completely removes song from database
    func removeSongs(at offsets: IndexSet) {
        songs.remove(atOffsets: offsets)
    }
    
    func moveSongs(fromOffsets source: IndexSet, toOffset destination: Int) {
      songs.move(fromOffsets: source, toOffset: destination)
    }
}
