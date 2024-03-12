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
        @State private var citys: [MeteoDataModel.City] = []
        @State private var hourlyWeatherData: [MeteoDataModel.WeatherData] = []
        @State private var currentUnitsData: [MeteoDataModel.Current] = []
        @State private var currentCity =  MeteoDataModel.City.tokyo
        @State private var isLoading = false
        @State private var meteoDataModel = MeteoDataModel()
        @State private var text: String = ""
        
        var body: some View {
            VStack {
                HStack {
                    
                    Button(action: {
                    }) {
                        Image(systemName: "globe.europe.africa.fill")
                            .resizable()
                            .foregroundColor(.blue)
                            .frame(width: 50, height: 50)
                            .position(CGPoint(x: 60.0, y: 28.0))
                          
                    }
                    
                    Text("Stockholm")
                        .font(.custom("Copperplate", size: 23))
                        .position(CGPoint(x: 55.0, y: 28.0))
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .foregroundColor(.pink)
                            .frame(width: 50, height: 50)
                            .position(CGPoint(x: 60.0, y: 28.0))
                           
                    }
                }
                
             
                ZStack {
                    Rectangle()
                        .stroke(Color.black, lineWidth: 3)
                        .frame(width: 340, height: 556)
                        .foregroundColor(.white)
                        .position(x: 200, y: 230)
                    
                   
                        LazyVStack(spacing: 10) {
                            ForEach(hourlyWeatherData, id: \.self) { hourlyWeather in
                                HourlyWeatherRow(hourlyWeather: hourlyWeather, currentCity: currentCity )
                            }
                            
                        }
                        .position(CGPoint(x: 200.0, y: 20.0))
                        
                }
                
                ZStack {
                    Image(systemName: "cloud.fill")
                        .resizable()
                        .frame(width: 300, height: 150)
                        .foregroundColor(.blue)
                        .position(CGPoint(x: 200.0, y: 0.0))

                    ScrollView {
                        LazyVStack(spacing: 10) {
                            ForEach(hourlyWeatherData, id: \.self) { hourlyWeather in
                                HourlyWeather(hourlyWeather: hourlyWeather, currentCity: currentCity)
                            }
                        }
                    }
                    .frame(width: 300, height: 150)
                    .position(CGPoint(x: 200.0, y: 0.0))
                }
                
                ZStack {
                    Rectangle()
                        .stroke(Color.black, lineWidth: 3)
                        .frame(width: 300, height: 250)
                        .foregroundColor(.white)
                        .position(CGPoint(x: 200.0, y: 60.0))

                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(hourlyWeatherData, id: \.self) { hourlyWeather in
                                DailyWeather(hourlyWeather: hourlyWeather, currentCity: currentCity)
                            }
                        }
                    }
                    .frame(width: 300, height: 250) // Set the frame of the ScrollView to match the Rectangle
                    .position(CGPoint(x: 200.0, y: 60.0))
                }
     
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(2)
                        
                    }
                
     
                HStack {

                    ZStack {
                        Rectangle()
                            .stroke(Color.black, lineWidth: 3)
                            .frame(width: 100, height: 100)
                            .position(x: 80, y: 200)
                        
                        Button(action: {
                           
                        }) {
                            Image(systemName: "questionmark")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 80, height: 80)
                                .position(x: 80, y: 200)
                        }
                        
                    }.frame(width: 300, height: 150)
                        .position(x: 150, y: 75)
                    
                    ZStack {
                        Rectangle()
                            .frame(width: 225, height: 55)
                            .position(x: 60, y: 175)
                        
                        TextField("Search location", text: $text)
                            .frame(width: 220, height: 50)
                            .background(Color.white)
                            .position(x: 60, y: 175)
                    }
                }
            }
            .onAppear {
                isLoading = true
                fetchHourlyWeatherData(currentCity)
               
            }
        }
        
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
              
                Text(" \(hourlyWeather.current.time) ")
                    .font(.custom("Copperplate", size: 24))
            
                 Text("temperature: \(String(format: "%.2f", hourlyWeather.current.temperature_2m)) °C")
                    .font(.custom("Copperplate", size: 24))
                
                Text("precipitation: \(String(format: "%.2f",hourlyWeather.current.precipitation)) mm")
                    .font(.custom("Copperplate", size: 24))
                
                Text("wind: \(String(format: "%.2f",hourlyWeather.current.wind_speed_10m)) m/s")
                    .font(.custom("Copperplate", size: 24))
                
            
                Spacer()
            }
            .padding()
            .background(Color.gray.opacity(0))
            .cornerRadius(10)
        }
    }

struct HourlyWeather: View {
    let hourlyWeather: MeteoDataModel.WeatherData
    let currentCity: MeteoDataModel.City

    var body: some View {
        ForEach(hourlyWeather.hourly.time.indices, id: \.self) { index in
            VStack {
                Text("Time: \(hourlyWeather.hourly.time[index]): ")
                    .font(.custom("Copperplate", size: 24))
                    .padding(.top)
                
                Text("Temperature: \(String(format: "%.2f", hourlyWeather.hourly.temperature_2m[index])) °C")
                    .font(.custom("Copperplate", size: 24))

                Text("Humidity: \(String(format: "%.2f", hourlyWeather.hourly.relative_humidity_2m[index])) %")
                    .font(.custom("Copperplate", size: 24))
                  
                Text("Precipitation: \(String(format: "%.2f", hourlyWeather.hourly.precipitation[index])) mm")
                    .font(.custom("Copperplate", size: 24))

                Text("UV-index: \(String(format: "%.2f", hourlyWeather.hourly.uv_index[index])) ")
                    .font(.custom("Copperplate", size: 24))

                Text("Wind \(String(format: "%.2f", hourlyWeather.hourly.wind_speed_10m[index])) m/s")
                    .font(.custom("Copperplate", size: 24))
                    .padding(.bottom)
                    .padding(.bottom)
            
            Divider()
            }
        }
    }
}

struct DailyWeather: View {
    let hourlyWeather: MeteoDataModel.WeatherData
    let currentCity: MeteoDataModel.City

    var body: some View {
        ForEach(hourlyWeather.hourly.time.indices, id: \.self) { index in
            VStack {
                ForEach(hourlyWeather.daily.time.indices, id: \.self) { index in
                        Text("Date: \(hourlyWeather.daily.time[index])")
                        .font(.custom("Copperplate", size: 24))
                        .padding(.top)
                        
                        Text("Max Temperature: \(String(format: "%.2f", hourlyWeather.daily.temperature_2m_max[index]))°C")
                        .font(.custom("Copperplate", size: 24))
                        Text("Min Temperature: \(String(format: "%.2f", hourlyWeather.daily.temperature_2m_min[index]))°C")
                        .font(.custom("Copperplate", size: 24))
                        
                        Text("Precipitation: \(String(format: "%.2f", hourlyWeather.daily.precipitation_hours[index]))mm")
                        .font(.custom("Copperplate", size: 24))
                        
                        Text("UV-index: \(String(format: "%.2f", hourlyWeather.daily.uv_index_max[index]))")
                        .font(.custom("Copperplate", size: 24))
                        
                        Text("Sunrise: \(hourlyWeather.daily.sunrise[index])")
                        .font(.custom("Copperplate", size: 24))
                        
                        Text("Sunset: \(hourlyWeather.daily.sunset[index])")
                        .font(.custom("Copperplate", size: 24))
                        .padding(.bottom)
                    Divider()
                   
                    }
                }
        }
    }
}


    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
