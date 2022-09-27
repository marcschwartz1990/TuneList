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
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title)
    ]) var songs: FetchedResults<Song>
    
    @State private var showingAddEditSong = false
    
    @State private var selectedSong: Song?
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(songs) { song in
                    SongTitleView(song: song)
                }
                .onDelete(perform: deleteSongs)
            }
            .sheet(isPresented: $showingAddEditSong) {
                AddEditSongView(song: selectedSong, isNewSong: true)
            }
        }
        .navigationTitle("Quick Reference")
        .toolbar {
            HStack {
                EditButton()
                
                Button {
                    showingAddEditSong = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
    func sortByTitle() {
        // MARK: - Sort fetchrequest by title
    }
    
    func sortByKey() {
        // MARK: - Sort fetchrequest by key
    }
    
    func sortByStyle() {
        // MARK: - Sort fetchrequest by style
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
