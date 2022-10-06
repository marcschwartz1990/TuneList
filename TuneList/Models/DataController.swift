//
//  DataController.swift
//  TuneList
//
//  Created by Marc-Developer on 9/16/22.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    
    // NSPersistentContainer is responsible for loading data from CoreData and giving us access to data inside.
    // name parameter must match the database file name.
    let container = NSPersistentContainer(name: "TuneList")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
