//
//  ContentView.swift
//  TuneList
//
//  Created by Marc-Developer on 9/8/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationView {
            List {
                Section {
                    NavigationLink {
                        QuickReferenceView()
                    } label: {
                        Text("Quick Reference")
                    }
                    
                    NavigationLink {
                        SongIndexView()
                    } label: {
                        Text("Song Index")
                    }
                    
                    NavigationLink {
                        SetListsView()
                    } label: {
                        Text("Set Lists")
                    }
                    
                    NavigationLink {
                        SongLyricSearchView()
                    } label: {
                        Text("Song Lyrics")
                    }
                }
                .padding()
                .font(.headline)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
