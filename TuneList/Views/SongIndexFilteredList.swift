//
//  SongIndexFilteredList.swift
//  TuneList
//
//  Created by Marc-Developer on 9/26/22.
//

import SwiftUI

struct SongIndexFilteredList: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest var fetchRequest: FetchedResults<Song>
    
    @State private var showingDetailView = false
    
    init(filter: String) {
        if filter.isEmpty {
            _fetchRequest = FetchRequest<Song>(sortDescriptors: [SortDescriptor(\.title)])
        } else {
            _fetchRequest = FetchRequest<Song>(sortDescriptors: [SortDescriptor(\.title)], predicate: NSPredicate(format: "title CONTAINS[cd] %@", filter))
        }
    }
    
    var body: some View {
        List {
            ForEach(fetchRequest, id: \.self) { song in
                SongTitleIndexView(song: song)
            }
            .onDelete(perform: deleteSongs)
        }
        .font(.subheadline)
    }
    
    func deleteSongs(at offsets: IndexSet) {
        for offset in offsets {
            let song = fetchRequest[offset]
            moc.delete(song)
        }
    }
}
