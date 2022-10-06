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
            // Injecting data into the app (Environment)
            // managedObjectContext is the data living in memory pulled from storage so it can be manipulated then saved later.
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
