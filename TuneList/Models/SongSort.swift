//
//  SongSort.swift
//  TuneList
//
//  Created by Marc-Developer on 10/3/22.
//

import Foundation

struct SongSort: Hashable, Identifiable {
    let id: Int
    let name: String
    let descriptors: [SortDescriptor<Song>]
    
    static let sorts: [SongSort] = [
        SongSort(
            id: 0,
            name: "By Title",
            descriptors: [
                SortDescriptor(\Song.title, order: .forward)
            ]),
        
        SongSort(
            id: 1,
            name: "By Key",
            descriptors: [
                SortDescriptor(\Song.key, order: .forward),
                SortDescriptor(\Song.title, order: .forward)
            ]),
        
        SongSort(
            id: 2,
            name: "By Style",
            descriptors: [
                SortDescriptor(\Song.style, order: .forward),
                SortDescriptor(\Song.title, order: .forward)
            ])
        ]
    
    static var `default`: SongSort { sorts[0] }
}
