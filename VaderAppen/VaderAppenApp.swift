//
//  VaderAppenApp.swift
//  VaderAppen
//
//  Created by Moa.Svensson on 2024-02-28.
//


import SwiftUI
@main
struct VaderAppenApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(selectedCity: .constant(nil)) // Providing nil as the default value
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

