//
//  VaderAppenApp.swift
//  VaderAppen
//
//  Created by Moa.Svensson on 2024-02-28.
//

import SwiftUI
import CoreData
import UIKit


class AppDelegate: NSObject, UIApplicationDelegate {
    private func applicationDidFinishLaunching(_ notification: Notification) {
        guard let app = notification.object as? UIApplication else {
            fatalError("no application object")
        }}
    
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
}

