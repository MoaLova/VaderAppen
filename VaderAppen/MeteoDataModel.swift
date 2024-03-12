//
//  MeteoDataModel.swift
//  VaderAppen
//
//  Created by luma on 2024-03-08.
//

import Foundation
import OpenMeteoSdk

class MeteoDataModel {

    enum City: String, CaseIterable, Identifiable {
        case stockholm
        case newYork
        case tokyo
        case custom
        
        var id: String { self.rawValue }

        var coordinates: (latitude: Double, longitude: Double) {
            switch self {
                case .stockholm:
                    return (latitude: 59.3293, longitude: 18.0686)
                case .newYork:
                    return (latitude: 40.7128, longitude: -74.0060)
                case .tokyo:
                    return (latitude: 35.682839, longitude: 139.759455)
                case .custom:
                    // Return values for custom case
                    return (latitude: City.customLatitudeValue, longitude: City.customLongitudeValue)
            }
        }
        
        // Add static variables for custom latitude and longitude
        static var customLatitudeValue: Double = 0.0
        static var customLongitudeValue: Double = 0.0
    }

    
    
    
    struct WeatherData: Decodable, Hashable{
        let current: Current
       // let minutely_15: Minutely15
       // let minutely_15_units: Minutely15Units
        let hourly: Hourly
        let daily: Daily
     
        
        
    }
    
   struct Daily: Decodable, Hashable {
        let time: [String]
        let weather_code: [Float]
        let temperature_2m_max: [Float]
        let temperature_2m_min: [Float]
        let precipitation_hours: [Float]
        let uv_index_max: [Float]
        let sunrise: [String]
        let sunset: [String]
        


   }
    
    struct Hourly: Decodable, Hashable{
        let time: [String]
        let temperature_2m : [Float]
        let relative_humidity_2m: [Float]
        let precipitation: [Float]
        let uv_index: [Float]
        let wind_speed_10m: [Float]
    }
    
    struct Current: Decodable, Hashable{
        let temperature_2m : Float
        let precipitation : Float
        let wind_speed_10m : Float
        let time: String
        
    }
    
//    struct Minutely15: Decodable, Hashable{
//        let time: [String]
//        let temperature_2m: [Float]
//
//    }
//    struct Minutely15Units: Decodable, Hashable {
//        let temperature_2m: String
//
//        var temperatureFloat: Float? {
//            return Float(temperature_2m)
//        }
//    }
    
    
    func fetchWeatherData(_ currentCity: City,completion: @escaping ([WeatherData]?) -> Void) {
        guard let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=\(currentCity.coordinates.latitude)&longitude=\(currentCity.coordinates.longitude)&current=temperature_2m,relative_humidity_2m,is_day,precipitation,wind_speed_10m,wind_direction_10m&minutely_15=temperature_2m,relative_humidity_2m,precipitation&hourly=temperature_2m,relative_humidity_2m,precipitation_probability,precipitation,wind_speed_10m,uv_index,is_day&daily=weather_code,temperature_2m_max,temperature_2m_min,sunrise,sunset,daylight_duration,uv_index_max,precipitation_hours&wind_speed_unit=ms&timezone=Europe%2FBerlin&past_hours=1&past_minutely_15=1&forecast_days=7&forecast_hours=12&forecast_minutely_15=48&models=best_match&format=json") else {
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
