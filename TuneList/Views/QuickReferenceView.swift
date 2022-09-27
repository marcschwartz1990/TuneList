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
            .sheet(item: $selectedSong, content: { song in
                AddEditSongView(song: selectedSong)
            })
            .sheet(isPresented: $showingAddEditSong, onDismiss: {selectedSong = nil}) {
                AddEditSongView(song: selectedSong)
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
        // MARK: - Find out how to sort fetchrequest by title when user selects to sort by title.
        
//        do {
//            let request = Song.fetchRequest() as NSFetchRequest<Song>
//
//            let sort = NSSortDescriptor(key: "title", ascending: true)
//            request.sortDescriptors = [sort]
//
//            self.items = try context.fetch(request)
//
//            }
//        }
    }
    
    func deleteSongs(at offsets: IndexSet) {
        for offset in offsets {
            let song = songs[offset]
            moc.delete(song)
        }
        
        //        try? moc.save() // Commented out for testing purposes.
    }
}

struct QuickReferenceView_Previews: PreviewProvider {
    static var previews: some View {
        QuickReferenceView()
    }
}
