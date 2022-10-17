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
                    }
                    .navigationTitle("MyTuneList")
                    .padding()
                    .font(.headline)
                }
                .listStyle(.insetGrouped)
                .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
