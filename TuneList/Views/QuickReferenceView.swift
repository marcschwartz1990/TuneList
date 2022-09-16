//
//  QuickReferencerView.swift
//  TuneList
//
//  Created by Marc-Developer on 9/8/22.
//

import SwiftUI

struct QuickReferenceView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title)
    ]) var songs: FetchedResults<Song>
    
    @State private var showingAddSong = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(songs) { song in
                    SongTitleView(song: song)
                }
                .onDelete(perform: deleteSongs)
            }
            .navigationTitle("Quick Reference")
            .toolbar {
                HStack {
                    Button {
                        print("Sort by Button Pressed")
                    } label: {
                        Text("Sort by")
                    }
                    
                    EditButton()
                    
                    Button {
                        showingAddSong = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddSong) {
                AddSongView()
            }
        }
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
