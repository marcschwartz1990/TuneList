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
    
    // Completely removes song from database
    func removeSongs(at offsets: IndexSet) {
        songs.remove(atOffsets: offsets)
    }
    
    func moveSongs(fromOffsets source: IndexSet, toOffset destination: Int) {
      songs.move(fromOffsets: source, toOffset: destination)
    }
}
