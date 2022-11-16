//
//  TBD_AppApp.swift
//  TBD_App
//
//  Created by Many Kaufmann und Nizam Oezdemir on 16.11.22.
//  Hoi
// Many Many Many

import SwiftUI

@main
struct TBD_AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
