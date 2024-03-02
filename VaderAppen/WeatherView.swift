//
//  WeatherView.swift
//  VaderAppen
//
//  Created by Elin.Andersson on 2024-02-29.
//

import Foundation
import SwiftUI

struct WeatherView: View {
    @StateObject var viewModel = WeatherViewModel()

    var body: some View {
        VStack {
            Text(viewModel.temperature)
                .font(.largeTitle)
                .padding()
            
            Button("Weather in Stockholm") {
                viewModel.fetchWeather(cityName: "Stockholm")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}
