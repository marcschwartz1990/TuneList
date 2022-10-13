//
//  SongTitleIndexView.swift
//  TuneList
//
//  Created by Marc-Developer on 9/16/22.
//

import SwiftUI

struct SongTitleIndexView: View {
    @State private var showingSongDetailView = false
    
    let song: Song
    
    var body: some View {
        Button {
            showingSongDetailView = true
        } label: {
            Text("\(song.title ?? "Unknown Song")")
                .foregroundColor(.black)
        }
        .sheet(isPresented: $showingSongDetailView) {
            SongDetailView(song: song, isPresented: $showingSongDetailView)
        }
    }
}
