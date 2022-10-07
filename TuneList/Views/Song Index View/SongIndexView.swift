//
//  SongIndexView.swift
//  TuneList
//
//  Created by Marc Schwartz on 9/11/22.
//

import SwiftUI

struct SongIndexView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var selectedSong: Song?
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            SongIndexFilteredList(filter: searchText)
        }
        .searchable(text: $searchText)
        .navigationTitle("Song Index")
    }
}

struct SongIndexView_Previews: PreviewProvider {
    static var previews: some View {
        SongIndexView()
    }
}
