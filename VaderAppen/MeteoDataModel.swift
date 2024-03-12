//
//  MeteoDataModel.swift
//  VaderAppen
//
//  Created by Sarah Lidberg on 2024-03-08.
//

import Foundation
import OpenMeteoSdk

enum City: CaseIterable {
    case stockholm, newYork, tokyo, london, paris, berlin, rome, madrid, oslo, helsinki, copenhagen, dublin, prague, vienna, budapest, athens, lisbon, brussels, warsaw, amsterdam
//
//    var name: String {
//        switch self {
//        case .stockholm: return "Stockholm"
//        case .newYork: return "New York"
//        case .tokyo: return "Tokyo"
//        case .london: return "London"
//        case .paris: return "Paris"
//        case .berlin: return "Berlin"
//        case .rome: return "Rome"
//        case .madrid: return "Madrid"
//        case .oslo: return "Oslo"
//        case .helsinki: return "Helsinki"
//        case .copenhagen: return "Copenhagen"
//        case .dublin: return "Dublin"
//        case .prague: return "Prague"
//        case .vienna: return "Vienna"
//        case .budapest: return "Budapest"
//        case .athens: return "Athens"
//        case .lisbon: return "Lisbon"
//        case .brussels: return "Brussels"
//        case .warsaw: return "Warsaw"
//        case .amsterdam: return "Amsterdam"
//        }
//    }
}

class MeteoDataModel {

    enum City {
        case stockholm
        case newYork
        case tokyo
        case london
        case paris
        case berlin
        case rome
        case madrid
        case oslo
        case helsinki
        case copenhagen
        case dublin
        case prague
        case vienna
        case budapest
        case athens
        case lisbon
        case brussels
        case warsaw
        case amsterdam
        
        var coordinates: (latitude: Double, longitude: Double) {
            switch self {
            case .stockholm: return (59.3293, 18.0686)
            case .newYork: return (40.7128, -74.0060)
            case .tokyo: return (35.682839, 139.759455)
            case .london: return (51.5074, -0.1278)
            case .paris: return (48.8566, 2.3522)
            case .berlin: return (52.5200, 13.4050)
            case .rome: return (41.9028, 12.4964)
            case .madrid: return (40.4168, -3.7038)
            case .oslo: return (59.9139, 10.7522)
            case .helsinki: return (60.1699, 24.9384)
            case .copenhagen: return (55.6761, 12.5683)
            case .dublin: return (53.3498, -6.2603)
            case .prague: return (50.0755, 14.4378)
            case .vienna: return (48.2082, 16.3738)
            case .budapest: return (47.4979, 19.0402)
            case .athens: return (37.9838, 23.7275)
            case .lisbon: return (38.7223, -9.1393)
            case .brussels: return (50.8503, 4.3517)
            case .warsaw: return (52.2297, 21.0122)
            case .amsterdam: return (52.3676, 4.9041)
            }
        }
    }
    

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
                return (latitude: MeteoDataModel.customLatitudeValue, longitude: MeteoDataModel.customLongitudeValue)
            }
        }
    }
    
    // Add static variables for custom latitude and longitude
    static var customLatitudeValue: Double = 0.0
    static var customLongitudeValue: Double = 0.0

    
    
    

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
