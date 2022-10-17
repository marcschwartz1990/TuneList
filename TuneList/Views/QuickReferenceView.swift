//
//  QuickReferencerView.swift
//  TuneList
//
//  Created by Marc-Developer on 9/8/22.
//

import SwiftUI

struct QuickReferenceView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
        sortDescriptors: SongSort.default.descriptors,
        animation: .default)
    private var songs: FetchedResults<Song>
    
    @State private var selectedSort = SongSort.default
    @State private var showingAddSongView = false
    @State private var showingEditSongView = false
    
    var body: some View {
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
