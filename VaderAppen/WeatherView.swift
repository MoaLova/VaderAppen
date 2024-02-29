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
            
            Button("Fetch Weather") {
                viewModel.fetchWeather(cityName: "Stockholm")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}
