//
//  PersistenceVader.swift
//  VaderAppen
//
//  Created by Moa.Svensson on 2024-03-12.
//

import Foundation
import CoreData

struct PersistenceVader{
    static let shared = PersistenceVader()
    
    let container: NSPersistentContainer
    init(){
        container = NSPersistentContainer(name: "VaderAppenViewModel")
        
        container.loadPersistentStores { (description, error) in
            
            if let error = error{
                print("Error loading core data: \(error)")
            }else{
                print("sucess core data")
            }
            
        }
    }
        
}
