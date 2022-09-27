//
//  SongIndexView.swift
//  TuneList
//
//  Created by Marc Schwartz on 9/11/22.
//

import SwiftUI

struct SongIndexView: View {
    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(sortDescriptors: [
//        SortDescriptor(\.title)
//    ]) var songs: FetchedResults<Song>
    
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
                    Image(systemName: "plus")
                }
            }
        }
    }
    
//    func deleteSongs(at offsets: IndexSet) {
//        for offset in offsets {
//            let song = songs[offset]
//            moc.delete(song)
//        }
        
        //        try? moc.save() // Commented out for testing purposes.
}

struct SongIndexView_Previews: PreviewProvider {
    static var previews: some View {
        SongIndexView()
    }
}
