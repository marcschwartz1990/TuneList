//
//  ContentView.swift
//  TuneList
//
//  Created by Marc-Developer on 9/8/22.
//

import SwiftUI

struct ContentView: View {
    // New Since COREDATA
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title)
    ]) var songs: FetchedResults<Song>
    
    var body: some View {
        
        NavigationView {
            VStack {
                NavigationLink {
                    QuickReferenceView()
                } label: {
                    Text("Quick Reference")
                }
                .padding()
                
                NavigationLink {
                    SongIndexView()
                } label: {
                    Text("Song Index")
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
