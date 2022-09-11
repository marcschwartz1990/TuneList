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
    
    func removeSongs(at offsets: IndexSet) {
        songs.remove(atOffsets: offsets)
    }
}
