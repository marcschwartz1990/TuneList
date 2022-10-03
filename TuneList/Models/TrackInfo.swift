//
//  TrackInfo.swift
//  TuneList
//
//  Created by Marc-Developer on 9/28/22.
//

import Foundation

struct TrackInfo: Codable {
    let message: Message
}

struct Message: Codable {
    let body: Body
}

struct Body: Codable {
    let trackList: [TrackObject]
    
    private enum CodingKeys: String, CodingKey {
        case trackList = "track_list"
    }
}

struct TrackObject: Codable {
    let track: Track
}

struct Track: Codable {
    let commontrackID: Int
    let hasLyrics: Int
    let trackName: String
    let albumName: String
    let artistName: String
    
    private enum CodingKeys: String, CodingKey {
        case commontrackID = "commontrack_id"
        case hasLyrics = "has_lyrics"
        case trackName = "track_name"
        case albumName = "album_name"
        case artistName = "artist_name"
    }
}


