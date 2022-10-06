//
//  TuneTItleView.swift
//  TuneList
//
//  Created by Marc-Developer on 9/9/22.
//

import SwiftUI

struct SongTitleView: View {
    // MARK: - Find out why this song is an ObservedObject.
    @ObservedObject var song: Song
    
    @State private var isShowingSongDetailView = false
    @State private var isShowingAddEditSongView = false
    
    init(song: Song) {
        self.song = song
    }
    
    var body: some View {
        HStack {
            SongDataView()
            
            Spacer()
            
            SongMenuView()
            .sheet(isPresented: $isShowingSongDetailView) {
                SongDetailView(song: song)
            }
            .sheet(isPresented: $isShowingAddEditSongView) {
                AddEditSongView(song: song, isNewSong: false)
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
                showSongDetailView()
            }
            
            Button("Edit Song Info") {
                showAddEditSongView()
            }
        } label: {
                Image(systemName: "ellipsis")
                    .font(.headline)
        }
    }
    
    func showSongDetailView() {
        isShowingSongDetailView = true
    }
    
    func showAddEditSongView() {
        isShowingAddEditSongView = true
    }
    
}

// MARK: - Fix this preview

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
