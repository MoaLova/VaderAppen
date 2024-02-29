//
//  WeatherViewModel.swift
//  VaderAppen
//
//  Created by Elin.Andersson on 2024-02-29.

//WeatherViewModel: Klassen som fungerar som en brygga mellan din modell och vy. Den ska hantera all logik för datatransformation så att vyn kan förbli så dum (icke-logisk) som möjligt.

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var temperature: String = "--"
    private var weatherService = WeatherService()
    
    func fetchWeather(cityName: String) {
        weatherService.fetchWeather(cityName: cityName) { weatherResponse in
            DispatchQueue.main.async {
                if let weatherResponse = weatherResponse {
                    self.temperature = "\(weatherResponse.main.temp)°C"
                }
            }
        }
    }
}
