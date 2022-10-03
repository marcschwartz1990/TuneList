//
//  SongLyrics.swift
//  TuneList
//
//  Created by Marc-Developer on 9/28/22.
//

import Foundation

struct SongLyrics: Codable {
    let message: Message
    
    struct Message: Codable {
        let body: Body
    }

    struct Body: Codable {
        let lyrics: Lyrics
    }

    struct Lyrics: Codable {
        let lyricsBody: String
        
        private enum CodingKeys: String, CodingKey {
            case lyricsBody = "lyrics_body"
        }
    }
    
    var storedLyrics: String = ""
}
