//
//  QuickReferencerView.swift
//  TuneList
//
//  Created by Marc-Developer on 9/8/22.
//

import SwiftUI

// MARK: - If there are no songs, create a cover page that says how to create a song
// MARK: - Sorting before there are songs crashes the app. Disable button until there is a song with valid key and style. Style can be blank but need to return SOMETHING.

struct QuickReferenceView: View {
    // This code is giving us the ability to manipulate the data in the environment from managedObjectContext.
    @Environment(\.managedObjectContext) var moc
    //@FetchRequest is not loading directly from storage, it looks in the environment and finds data in the managedObjectContext that was injected in TuneListApp
    @FetchRequest(
        sortDescriptors: SongSort.default.descriptors,
        animation: .default)
    private var songs: FetchedResults<Song>
    
    @State private var selectedSort = SongSort.default
    @State private var showingAddSongView = false
    
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(songs) { song in
                        SongTitleView(song: song)
                    }
                    .onDelete(perform: deleteSongs)
                } header: {
                    if songs.count < 1 {
                        Text("")
                    } else {
                        Text("Songs")
                    }
                }
            }
            
            .fullScreenCover(isPresented: $showingAddSongView) {
                AddSongView(isPresented: $showingAddSongView)
            }
        }
        .navigationTitle("Quick Reference")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                SortSelectionView(
                    selectedSortItem: $selectedSort,
                    sorts: SongSort.sorts)
                .onChange(of: selectedSort) { _ in
                    songs.sortDescriptors = selectedSort.descriptors
                }
                
                Button {
                    showingAddSongView = true
                } label: {
                    Image(systemName: "plus.circle")
                }
            }
        }
    }
    
    func deleteSongs(at offsets: IndexSet) {
        for offset in offsets {
            let song = songs[offset]
            moc.delete(song)
        }
        
        try? moc.save()
    }
}

struct QuickReferenceView_Previews: PreviewProvider {
    static var previews: some View {
        QuickReferenceView()
    }
}
