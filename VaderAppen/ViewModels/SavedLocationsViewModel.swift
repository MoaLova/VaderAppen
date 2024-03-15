//
//  SavedLocationsViewModel.swift
//  VaderAppen
//
//  Created by Leonardo.Ahlm on 2024-03-15.
//

import Foundation
import SwiftUI

class SavedLocationsViewModel {
    
    
    func removeCity(at index: Int) {
            var savedLocationsView = SavedLocationsView()
            var updatedCities = savedLocationsView.savedCities
            updatedCities.remove(at: index)
            UserDefaults.standard.set(updatedCities, forKey: "selectedCities")
        }
    
}
