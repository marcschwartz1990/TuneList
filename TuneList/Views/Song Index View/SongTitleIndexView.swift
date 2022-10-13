//
//  SongTitleIndexView.swift
//  TuneList
//
//  Created by Marc-Developer on 9/16/22.
//

import SwiftUI

struct SongTitleIndexView: View {
    @State private var showingSongDetailView = false
    
    @StateObject var song: Song
    
    init(song: Song) {
        _song = StateObject(wrappedValue: song)
    }
    
    var body: some View {
        Button {
            showingSongDetailView = true
        } label: {
            Text(song.wrappedTitle)
                .foregroundColor(.black)
        }
        .sheet(isPresented: $showingSongDetailView) {
            SongDetailView(song: song, isPresented: $showingSongDetailView)
        }
    }
}
