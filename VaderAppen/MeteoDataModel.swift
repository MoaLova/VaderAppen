//
//  MeteoDataModel.swift
//  VaderAppen
//
//  Created by Sarah Lidberg on 2024-03-08.
//

import Foundation
import OpenMeteoSdk

class MeteoDataModel {
    
    struct HourlyWeather: Decodable, Hashable{
       
        let longitude: Float
        let latitude: Float
       
        
    }

    func fetchHourlyWeatherData(completion: @escaping ([HourlyWeather]?) -> Void) {
        guard let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=59.3294&longitude=18.0687&hourly=temperature_2m&timezone=Europe%2FBerlin&forecast_days=1&forecast_hours=12&forecast_minutely_15=4&models=best_match&format=json") else {
            print("Invalid URL")
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data received: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                let hourlyWeatherData = try decoder.decode(HourlyWeather.self, from: data)
                print(hourlyWeatherData)
                completion([hourlyWeatherData])
            } catch {
                print("Error decoding JSON: \(error)")
                completion(nil)
            }
        }.resume()
    }
}
