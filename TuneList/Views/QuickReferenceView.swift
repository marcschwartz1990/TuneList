//
//  QuickReferencerView.swift
//  TuneList
//
//  Created by Marc-Developer on 9/8/22.
//

import SwiftUI



// MARK: - Add sorting functionality. User should be able to sort by Title, Key or Style



struct QuickReferenceView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
        sortDescriptors: SongSort.default.descriptors,
        animation: .default)
    private var songs: FetchedResults<Song>
    
    @State private var selectedSort = SongSort.default
    
    @State private var showingAddEditSong = false
    
    @State private var selectedSong: Song?
    
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Songs")) {
                    ForEach(songs) { song in
                        SongTitleView(song: song)
                    }
                    .onDelete(perform: deleteSongs)
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    SortSelectionView(
                        selectedSortItem: $selectedSort,
                        sorts: SongSort.sorts)
                    .onChange(of: selectedSort) { _ in
                        songs.sortDescriptors = selectedSort.descriptors
                    }
                    
                    Button {
                        showingAddEditSong = true
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                }
            }
            .sheet(isPresented: $showingAddEditSong) {
                AddEditSongView(song: selectedSong, isNewSong: true)
            }
        }
        .navigationTitle("Quick Reference")
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
