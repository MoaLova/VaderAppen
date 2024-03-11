//
//  ContentView.swift
//  VaderAppen
//
//  Created by Moa.Svensson on 2024-02-28.
//

//Hej
// nej

import CoreData
    
import SwiftUI
    struct ContentView: View {
       // @State private var hourly: [MeteoDataModel.Minutely15]
        @State private var citys: [MeteoDataModel.City] = []
        @State private var hourlyWeatherData: [MeteoDataModel.WeatherData] = []
        @State private var currentUnitsData: [MeteoDataModel.Current] = []
        @State private var currentCity =  MeteoDataModel.City.stockholm
        @State private var isLoading = false
        @State private var meteoDataModel = MeteoDataModel()
        @State private var text: String = ""
        
        var body: some View {
            VStack {
                HStack {
                    Text("07.00")
                        .position(x: 50, y: 10)
                    
                    Button(action: {
                        // Handle action
                    }) {
                        Image(systemName: "goforward")
                            .resizable()
                            .foregroundColor(.pink)
                            .frame(width: 50, height: 50)
                            .position(x: 50, y: 15)
                    }
                    
                    Button(action: {
                        // Handle action
                    }) {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .foregroundColor(.pink)
                            .frame(width: 50, height: 50)
                            .position(x: 50, y: 10)
                    }
                }
                
                Text("Location")
                    .position(x: 190, y: -120)
                    .font(.title)
                
                ZStack {
                    Rectangle()
                        .stroke(Color.black, lineWidth: 3)
                        .frame(width: 340, height: 556)
                        .foregroundColor(.white)
                        .position(x: 200, y: -10)
                    
                    ScrollView {
                        LazyVStack(spacing: 10) {
                                ForEach(hourlyWeatherData, id: \.self) { hourlyWeather in
                                    HourlyWeatherRow(hourlyWeather: hourlyWeather, currentCity: currentCity )
                                }
                           
                        }
                        .padding(.horizontal)
                    }
                    .frame(width: 360, height: 556)
                    .clipped()
                    .position(x: 200, y: -10)
                    
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(2)
                            .position(x: 200, y: -10)
                    }
                }
                
                HStack {
                    NavigationView {
                        WeatherView()
                    }
                    
                    ZStack {
                        Rectangle()
                            .stroke(Color.black, lineWidth: 3)
                            .frame(width: 100, height: 100)
                            .position(x: 80, y: 140)
                        
                        Button(action: {
                            // Handle action
                        }) {
                            Image(systemName: "questionmark")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 80, height: 80)
                                .position(x: 80, y: 140)
                        }
                    }
                    
                    ZStack {
                        Rectangle()
                            .frame(width: 225, height: 55)
                            .position(x: 60, y: 116)
                        
                        TextField("Search location", text: $text)
                            .frame(width: 220, height: 50)
                            .background(Color.white)
                            .position(x: 60, y: 116)
                    }
                }
            }
            .onAppear {
                isLoading = true
                // Fetch and populate hourly weather data
                fetchHourlyWeatherData(currentCity)
               
            }
        }
        
        // Function to fetch hourly weather data
        private func fetchHourlyWeatherData(_ currentCity: MeteoDataModel.City) {
            meteoDataModel.fetchWeatherData(currentCity) { fetchedWeatherData in
                if let fetchedHourlyWeatherData = fetchedWeatherData {
                    self.hourlyWeatherData = fetchedHourlyWeatherData
                    isLoading = false
                }
            }
        }
    }

    struct HourlyWeatherRow: View {
        let hourlyWeather: MeteoDataModel.WeatherData
        let currentCity: MeteoDataModel.City
        var body: some View {
            VStack {
                Text("Stockholm")
                
                Text(" \(hourlyWeather.current.time) ")
                Text("temperature \(hourlyWeather.current.temperature_2m) °C")
                Text("precipitation \(hourlyWeather.current.precipitation) mm")
                Text("wind \(hourlyWeather.current.wind_speed_10m) m/s")
                
                
                
                
                ForEach(hourlyWeather.hourly.time.indices, id: \.self) { index in
                    VStack {
                        Text("\(hourlyWeather.hourly.time[index]): ")
                        Text("\(hourlyWeather.hourly.temperature_2m[index]) \(hourlyWeather.minutely_15_units.temperature_2m)")
                        Text("\(hourlyWeather.hourly.relative_humidity_2m[index]) Humidity")
                        Text("\(hourlyWeather.hourly.precipitation[index]) mm")
                        Text("\(hourlyWeather.hourly.uv_index[index]) UV")
                        Text("\(hourlyWeather.hourly.wind_speed_10m[index]) m/s")
                        
                        
                    }
                }
                 
               
              


                
                
             VStack {
                    ForEach(hourlyWeather.daily.time.indices, id: \.self) { index in
                        VStack {
                            Text("Date: \(hourlyWeather.daily.time[index])")
                            Text("Max Temperature: \(hourlyWeather.daily.temperature_2m_max[index])°C")
                            Text("Min Temperature: \(hourlyWeather.daily.temperature_2m_min[index])°C")
                            Text("Precipitation: \(hourlyWeather.daily.precipitation_hours[index])mm")
                            Text("UV-index: \(hourlyWeather.daily.uv_index_max[index])")
                            Text("Sunrise: \(hourlyWeather.daily.sunrise[index])")
                            Text("Sunset: \(hourlyWeather.daily.sunset[index])")
                        }
                    }

                    
                }
                Spacer()
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
