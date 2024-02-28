//
//  VaderAppenApp.swift
//  VaderAppen
//
//  Created by luma on 2024-02-28.
//

import SwiftUI

@main
struct VaderAppenApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
