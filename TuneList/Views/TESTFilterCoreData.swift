//
//  TESTSortCoreData.swift
//  TuneList
//
//  Created by Marc-Developer on 9/26/22.
//

import CoreData
import SwiftUI

struct TESTFilterCoreData: View {
    @Environment(\.managedObjectContext) var moc
    @State private var titleFilter = "A"
    
    var body: some View {
        NavigationView {
            VStack {
                TESTFilteredList(filter: titleFilter)
                
                Button("Add Examples") {
                    let justFriends = Song(context: moc)
                    justFriends.title = "Just Friends"
                    justFriends.key = "G Major"
                    justFriends.style = "Medium Swing"
                    
                    let allTheThingsYouAre = Song(context: moc)
                    allTheThingsYouAre.title = "All The Things You Are"
                    allTheThingsYouAre.key = "Ab Major"
                    allTheThingsYouAre.style = "Medium Swing"
                    
                    try? moc.save()
                }
                
                Button("Show A") {
                    titleFilter = "A"
                }
                
                Button("Show J") {
                    titleFilter = "J"
                }
            }
        }
        .searchable(text: $titleFilter)
    }
}

struct TESTFilterCoreData_Previews: PreviewProvider {
    static var previews: some View {
        TESTFilterCoreData()
    }
}
