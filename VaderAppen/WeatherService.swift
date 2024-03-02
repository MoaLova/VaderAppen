//
//  WeatherService.swift
//  VaderAppen
//
//  Created by Elin.Andersson on 2024-02-29.
//en API-service-klass som är en singelton (shared), den hanterar API-anrop

import Foundation
class WeatherService {
    func fetchWeather(cityName: String, completion: @escaping (WeatherResponse?) -> Void) {
        // Läser API-nyckeln från en miljövariabel
        guard let apiKey = ProcessInfo.processInfo.environment["OPENWEATHERMAP_API_KEY"] else {
            print("API-nyckeln saknas")
            completion(nil)
            return
        }
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            completion(weatherResponse)
        }.resume()
    }
}
