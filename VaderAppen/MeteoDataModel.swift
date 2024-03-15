//
//  MeteoDataModel.swift
//  VaderAppen
//
//  Created by luma on 2024-03-08.
//

import Foundation
import OpenMeteoSdk

extension MeteoDataModel.City {
     var stringValue: String {
         return self.rawValue
     }

     init?(stringValue: String) {
         switch stringValue {
         case MeteoDataModel.City.stockholm.rawValue:
             self = .stockholm
         case MeteoDataModel.City.newYork.rawValue:
             self = .newYork
         case MeteoDataModel.City.tokyo.rawValue:
             self = .tokyo
         case MeteoDataModel.City.madrid.rawValue:
             self = .madrid
         case MeteoDataModel.City.paris.rawValue:
             self = .paris
         case MeteoDataModel.City.helsingfors.rawValue:
             self = .helsingfors
         case MeteoDataModel.City.köpenhamn.rawValue:
             self = .köpenhamn
         case MeteoDataModel.City.hongkong.rawValue:
             self = .hongkong
         case MeteoDataModel.City.oslo.rawValue:
             self = .oslo
         case MeteoDataModel.City.custom.rawValue:
             self = .custom
         default:
             return nil
         }
     }
 }

class MeteoDataModel {
    enum City: String, CaseIterable, Identifiable {
        case stockholm
        case newYork
        case tokyo
        case madrid
        case paris
        case helsingfors
        case köpenhamn
        case hongkong
        case oslo
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
                case .madrid:
                    return (latitude: 40.4165, longitude: -3.7026)
                case .paris:
                    return (latitude: 48.8534, longitude: 2.3488)
                case .helsingfors:
                    return (latitude: 60.1695, longitude: 24.9354)
                case .köpenhamn:
                    return (latitude: 55.6759, longitude: 12.5655)
                case .hongkong:
                    return (latitude: 22.2783, longitude: 114.1747)
                case .oslo:
                    return (latitude: 59.9127, longitude: 10.7461)
                case .custom:
                    
                    return (latitude: City.customLatitudeValue, longitude: City.customLongitudeValue)
            }
        }
        
       
        static var customLatitudeValue: Double = 0.0
        static var customLongitudeValue: Double = 0.0
    }

    
    
    
    struct WeatherData: Decodable, Hashable{
        let current: Current
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
    
    
    
}
