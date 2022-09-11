//
//  QuickReferencerView.swift
//  TuneList
//
//  Created by Marc-Developer on 9/8/22.
//

import SwiftUI

struct QuickReferenceView: View {
    @State private var sampleTuneTitles = ["Body and Soul", "All The Things You Are", "Just Friends"]
    
    let songs: [Song]
    
    var body: some View {
        List {
            ForEach(songs) { title in
                SongTitleView(song: Song())
            }
        }
    }
}

struct QuickReferenceView_Previews: PreviewProvider {
    static var previews: some View {
        QuickReferenceView(songs: [Song(), Song()])
    }
}
