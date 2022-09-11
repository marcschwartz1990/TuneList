//
//  PracticeEditableListSundell.swift
//  TuneList
//
//  Created by Marc-Developer on 9/10/22.
//

import SwiftUI

struct TodoItem: Identifiable {
    let id: UUID
    var title: String
}

struct PracticeEditableListSundell: View {
    @State private var users = ["Paul", "Taylor", "Adele"]

    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.self) { user in
                    Text(user)
                }
                .onDelete(perform: delete)
            }
            .toolbar {
                EditButton()
            }
        }
    }

    func delete(at offsets: IndexSet) {
        users.remove(atOffsets: offsets)
    }
}
    
    
    
//    @Binding var items: [TodoItem]
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                List {
//                    ForEach($items) { $item in
//                        TextField("Title", text: $item.title)
//                    }
//                }
//                TodoItemAddButton { newItem in
//                    items.append(newItem)
//                }
//            }
//            .navigationTitle("Todo list")
//        }
//    }
//}

struct PracticeEditableListSundell_Previews: PreviewProvider {
    static var previews: some View {
        PracticeEditableListSundell()
    }
}
