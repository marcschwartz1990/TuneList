//
//  TESTFilteredList.swift
//  TuneList
//
//  Created by Marc-Developer on 9/26/22.
//

import SwiftUI

struct TESTFilteredList: View {
    @FetchRequest var fetchRequest: FetchedResults<Song>
    
    var body: some View {
        List(fetchRequest, id: \.self) { song in
            Text(song.wrappedTitle)
        }
    }
    
    init(filter: String) {
        _fetchRequest = FetchRequest<Song>(sortDescriptors: [], predicate: NSPredicate(format: "title BEGINSWITH %@", filter))
    }
}
