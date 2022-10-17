//
//  SongIndexView.swift
//  TuneList
//
//  Created by Marc Schwartz on 9/11/22.
//

import SwiftUI

struct SongIndexView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: [])
    private var songs: FetchedResults<Song>
    
    @State private var searchText = ""
    @State private var fontSize = 32.0
    @State private var showingAddSongView = false
    
    var body: some View {
        NavigationView {
            SongIndexFilteredList(filter: searchText)
        }
        .fullScreenCover(isPresented: $showingAddSongView) {
            AddSongView(isPresented: $showingAddSongView)
        }
        .searchable(text: $searchText)
        .navigationTitle("Song Index")
        .toolbar {
            Button {
                showingAddSongView = true
            } label: {
                Image(systemName: "plus.circle")
            }
        }
        Text("Songs in Index: \(songs.count)")
    }
}

struct SongIndexView_Previews: PreviewProvider {
    static var previews: some View {
        SongIndexView()
    }
}
