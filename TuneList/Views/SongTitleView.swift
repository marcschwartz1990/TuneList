//
//  TuneTItleView.swift
//  TuneList
//
//  Created by Marc-Developer on 9/9/22.
//

import SwiftUI

struct SongTitleView: View {
    @StateObject var song: Song
    
    @State private var showingSongDetailView = false
    @State private var showingEditSongView = false
    
    init(song: Song) {
        _song = StateObject(wrappedValue: song)
    }
    
    var body: some View {
        HStack {
            SongDataView()
            
            Spacer()
            
            SongMenuView()
            .fullScreenCover(isPresented: $showingSongDetailView) {
                SongDetailView(song: song, isPresented: $showingSongDetailView)
            }
            .fullScreenCover(isPresented: $showingEditSongView) {
                EditSongView(song: song, isPresented: $showingEditSongView)
            }
        }
        .padding()
    }
    
    @ViewBuilder
    func SongDataView() -> some View {
        VStack(alignment: .leading) {
            Text("**\(song.wrappedTitle)**")
                .padding([.bottom, .trailing], 1)
            HStack {
                Text("**Key**: \(song.wrappedKey)")
                Text("|")
                Text("**Style**: \(song.wrappedStyle)")
            }
            .font(.caption)
        }
    }
    
    @ViewBuilder
    func SongMenuView() -> some View {
        Menu {
            Button("Song Details") {
                showingSongDetailView = true
            }
            
            Button("Edit Song Info") {
                showingEditSongView = true
            }
        } label: {
            Image(systemName: "ellipsis")
                .frame(width: 40, height: 40)
                .font(.headline)
        }
    }
}

// MARK: - Can I make an example preview that works everywhere from song?

struct SongTitleView_Previews: PreviewProvider {
    static let dataController = DataController()
    static var song: Song = {
        let context = dataController.container.viewContext
        let song = Song(context: context)
        song.key = "C Major"
        song.style = "Up Tempo"
        song.title = "Little Rock Getaway"
        return song
    }()
    

    static var previews: some View {
        SongTitleView(song: song)
            .environment(\.managedObjectContext, dataController.container.viewContext)

    }
}
