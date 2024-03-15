//
//  ContentViewModel.swift
//  VaderAppen
//
//  Created by Leonardo.Ahlm on 2024-03-15.
//

import Foundation

class ContentViewModel {
    
    func saveSelectedCity(_ city: MeteoDataModel.City) {
        var savedCities = UserDefaults.standard.array(forKey: "selectedCities") as? [String] ?? []
        savedCities.append(city.rawValue)
        UserDefaults.standard.set(savedCities, forKey: "selectedCities")
    }
}
