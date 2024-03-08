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
        let time : String
        let temperature : String
        let location: String
        
    }

    func fetchHourlyWeatherData(completion: @escaping ([HourlyWeather]?) -> Void) {
        guard let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=59.3294&longitude=18.0687&current=temperature_2m,relative_humidity_2m,is_day,precipitation,wind_speed_10m,wind_direction_10m&minutely_15=temperature_2m,relative_humidity_2m,precipitation&hourly=temperature_2m,relative_humidity_2m,precipitation_probability,precipitation,uv_index,is_day&daily=weather_code,temperature_2m_max,temperature_2m_min,sunrise,sunset,daylight_duration,uv_index_max,precipitation_hours&wind_speed_unit=ms&timezone=Europe%2FBerlin&past_hours=1&past_minutely_15=1&forecast_days=1&forecast_hours=12&forecast_minutely_15=48&models=best_match&format=flatbuffers") else {
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
                let hourlyWeatherData = try decoder.decode([HourlyWeather].self, from: data)
                completion(hourlyWeatherData)
            } catch {
                print("Error decoding JSON: \(error)")
                completion(nil)
            }
        }.resume()
    }
}
