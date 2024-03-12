//
//  MeteoDataModel.swift
//  VaderAppen
//
//  Created by Sarah Lidberg on 2024-03-08.
//

import Foundation
import CoreLocation
import OpenMeteoSdk




class MeteoDataModel {
    struct City: Identifiable, Equatable, Hashable { // Add Equatable and Hashable conformance
        let id = UUID() // Add an id property
        let name: String
        let coordinates: (latitude: Double, longitude: Double)
        
        static func == (lhs: City, rhs: City) -> Bool {
            return lhs.id == rhs.id
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    }
    
    struct WeatherData: Decodable, Hashable {
        let current: Current
        let hourly: Hourly
        let daily: Daily
    }
    
    struct Daily: Decodable, Hashable {
        let time: [String]
        let temperature_2m_max: [Float]
        let temperature_2m_min: [Float]
        let precipitation_hours: [Float]
        let uv_index_max: [Float]
        let sunrise: [String]
        let sunset: [String]
    }
    
    struct Hourly: Decodable, Hashable {
        let time: [String]
        let temperature_2m: [Float]
        let relative_humidity_2m: [Float]
        let precipitation: [Float]
        let uv_index: [Float]
        let wind_speed_10m: [Float]
    }
    
    struct Current: Decodable, Hashable {
        let temperature_2m: Float
        let precipitation: Float
        let wind_speed_10m: Float
        let time: String
    }
    
    var cities: [City] = []
    var allCityCases: [City] = []

    // Initialize with default cities
    init() {
        allCityCases = [
            City(name: "Stockholm", coordinates: (59.3293, 18.0686)),
            City(name: "New York", coordinates: (40.7128, -74.0060)),
            City(name: "Tokyo", coordinates: (35.682839, 139.759455))
        ]
        cities = allCityCases
    }
    
    func addCustomLocation(name: String, latitude: Double, longitude: Double) {
        let newCustomCity = City(name: name, coordinates: (latitude, longitude))
        if !cities.contains(newCustomCity) {
            cities.append(newCustomCity)
        }
    }
    
    func fetchWeatherData(_ currentCity: City, completion: @escaping ([WeatherData]?) -> Void) {
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


