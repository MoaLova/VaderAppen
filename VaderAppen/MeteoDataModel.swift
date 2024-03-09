//
//  MeteoDataModel.swift
//  VaderAppen
//
//  Created by Sarah Lidberg on 2024-03-08.
//

import Foundation
import OpenMeteoSdk

class MeteoDataModel {
    enum City {
        case stockholm
        case newYork
        case tokyo

        var coordinates: (latitude: Double, longitude: Double) {
            switch self {
            case .stockholm:
                return (latitude: 59.3293, longitude: 18.0686)
            case .newYork:
                return (latitude: 40.7128, longitude: -74.0060)
            case .tokyo:
                return (latitude: 35.682839, longitude: 139.759455)
            }
        }
    }
    struct WeatherData: Decodable, Hashable{
        //let time : String
        //let temperature : String
        //let location: String
        let longitude: Float
        let current: Current
    }
    
    struct Current: Decodable, Hashable{
        let temperature_2m : Float
    }
    
    func fetchWeatherData(_ currentCity: City,completion: @escaping ([WeatherData]?) -> Void) {
        guard let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=\(currentCity.coordinates.latitude)&longitude=\(currentCity.coordinates.longitude)&current=temperature_2m,relative_humidity_2m,is_day,precipitation,wind_speed_10m,wind_direction_10m&minutely_15=temperature_2m,relative_humidity_2m,precipitation&hourly=temperature_2m,relative_humidity_2m,precipitation_probability,precipitation,uv_index,is_day&daily=weather_code,temperature_2m_max,temperature_2m_min,sunrise,sunset,daylight_duration,uv_index_max,precipitation_hours&wind_speed_unit=ms&timezone=Europe%2FBerlin&past_hours=1&past_minutely_15=1&forecast_days=1&forecast_hours=12&forecast_minutely_15=48&models=best_match&format=json") else {
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
                let hourlyWeatherData = try decoder.decode(WeatherData.self, from: data)
                print(hourlyWeatherData)
                completion([hourlyWeatherData])
            } catch {
                print("Error decoding JSON: \(error)")
                completion(nil)
            }
        }.resume()
    }
}
