//
//  WeatherModel.swift
//  VaderAppen
//
//  Created by Sarah Lidberg on 2024-03-06.
//

import Foundation
//Modell för OpenWeatherMap API response, här definierar vi en model lsom matchar svaret från APIn

import Foundation

struct WeatherResponse: Codable {
    let main: WeatherMain
    let name: String
}

struct WeatherMain: Codable {
    let temp: Double
}
