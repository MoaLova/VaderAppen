//
//  WeatherModel.swift
//  VaderAppen
//
//  Created by Elin.Andersson on 2024-02-29.
//Modell för OpenWeatherMap API response, här definierar vi en model lsom matchar svaret från APIn

import Foundation

struct WeatherResponse: Codable {
    let main: WeatherMain
    let name: String
}

struct WeatherMain: Codable {
    let temp: Double
}
