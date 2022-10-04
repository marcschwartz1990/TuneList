//
//  SongIndexView.swift
//  TuneList
//
//  Created by Marc Schwartz on 9/11/22.
//

import SwiftUI

struct SongIndexView: View {
    @Environment(\.managedObjectContext) var moc
    
    @State private var showingAddSong = false
    @State private var selectedSong: Song?
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            SongIndexFilteredList(filter: searchText)
        }
        .sheet(isPresented: $showingAddSong) {
            AddEditSongView(song: selectedSong, isNewSong: true)
        }
        .searchable(text: $searchText)
        .navigationTitle("Song Index")
        .toolbar {
            HStack {
                EditButton()
                Button {
                    showingAddSong = true
                } label: {
                    Image(systemName: "plus.circle")
                }
            }
        }
    }
}

struct SongIndexView_Previews: PreviewProvider {
    static var previews: some View {
        SongIndexView()
    }
}
