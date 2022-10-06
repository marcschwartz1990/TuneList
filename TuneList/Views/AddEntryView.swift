//
//  AddEntryView.swift
//  TuneList
//
//  Created by Marc-Developer on 10/6/22.
//

//import SwiftUI
//
//// MARK: - Allow user to create their own Entries in AddEditSongView MORE INFO
//
//// User-defined entries can be stored as dictionaries in one property within the Song struct.
//// The properties should be able to be reordered manually by user.
//
//
//struct AddEntryView: View {
//    @State private var title = ""
//    @State private var value = ""
//    
//    let songEntries = SongEntries(songEntries: [SongEntry])
//    
//    var body: some View {
//        NavigationView {
//            Form {
//                TextField("Title", text: $title)
//                TextField("Value", text: $value)
//                Button("Save") {
//                    let newEntry = SongEntry(title: title, value: value)
//                    SongEntries.songEntries.append(newEntry)
//                }
//            }
//        }
//    }
//}
//
//struct AddEntryView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddEntryView()
//    }
//}
