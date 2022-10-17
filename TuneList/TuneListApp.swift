//
//  TuneListApp.swift
//  TuneList
//
//  Created by Marc-Developer on 9/8/22.
//

import SwiftUI

@main
struct TuneListApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
