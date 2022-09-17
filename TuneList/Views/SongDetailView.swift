//
//  SongDetailView.swift
//  TuneList
//
//  Created by Marc-Developer on 9/16/22.
//

import SwiftUI

struct SongDetailView: View {
    let song: Song
    
    var body: some View {
        Text(song.title ?? "Unknown Song Title")
            .font(.headline)
        Text(song.key ?? "Unknown Key")
            .font(.caption)
        Text(song.style ?? "Unknown Style")
            .font(.caption)
    }
}
