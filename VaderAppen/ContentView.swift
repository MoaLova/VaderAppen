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
        @State private var currentCity =  MeteoDataModel.City.custom
        @State private var isLoading = false
        @State private var meteoDataModel = MeteoDataModel()
        @State private var text: String = ""
        
        @State private var latitudeText = ""
        @State private var longitudeText = ""
        
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
                        .position(x: 200, y: 100)
                    
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
                    .position(x: 200, y: 100)
                    
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(2)
                            
                    }
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
                    }
                    
                    ZStack {
                        Rectangle()
                            .frame(width: 225, height: 35)
                            .position(x: 60, y: 166)
                        
                        Rectangle()
                            .frame(width: 225, height: 35)
                            .position(x: 60, y: 205)
                        
                        TextField("Add Latitude", text:$latitudeText)
                                        .frame(width: 220, height: 30)
                                        .background(Color.white)
                                        .position(x: 60, y: 166)
                                    
                                    TextField("Add Longitude", text: $longitudeText)
                                        .frame(width: 220, height: 30)
                                        .background(Color.white)
                                        .position(x: 60, y: 205)
                                    
                                    Button(action: {
                                        // Save latitude and longitude
                                        if let latitude = Double(latitudeText), let longitude = Double(longitudeText) {
                                            MeteoDataModel.customLatitudeValue = latitude
                                            MeteoDataModel.customLongitudeValue = longitude
                                            
                                            isLoading = true
                                                                                   fetchHourlyWeatherData(.custom)
                                        } else {
                                            // Handle invalid input
                                            print("Invalid latitude or longitude")
                                        }
                                    }, label: {
                                        Text("Save location")
                                    })
                                    .position(x: 60, y:250)
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
                
                Divider()
                Divider()
                Divider()
                
                
                ForEach(hourlyWeather.hourly.time.indices, id: \.self) { index in
                    VStack {
                        Text("\(hourlyWeather.hourly.time[index]): ")
                            .font(.custom("Copperplate", size: 24))
                        
                       
                        Text("temperature \(String(format: "%.2f", hourlyWeather.hourly.temperature_2m[index])) °C")
                            .font(.custom("Copperplate", size: 24))
                        
                        Text("humidity \(String(format: "%.2f", hourlyWeather.hourly.relative_humidity_2m[index])) %")
                            .font(.custom("Copperplate", size: 24))
                       
                        Text("precipitation \(String(format: "%.2f", hourlyWeather.hourly.precipitation[index])) mm")
                            .font(.custom("Copperplate", size: 24))
                        
                        Text("UV-index \(String(format: "%.2f", hourlyWeather.hourly.uv_index[index])) ")
                            .font(.custom("Copperplate", size: 24))
                       
                        Text("wind \(String(format: "%.2f", hourlyWeather.hourly.wind_speed_10m[index])) m/s")
                            .font(.custom("Copperplate", size: 24))
                    }
                }

                 
               
              Divider()
                Divider()
                Divider()

                
                
             VStack {
                 ForEach(hourlyWeather.daily.time.indices, id: \.self) { index in
                     
                         Text("Date: \(hourlyWeather.daily.time[index])")
                         .font(.custom("Copperplate", size: 24))
                         
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
                     }
                 }


                    
                
                Spacer()
            }
            .padding()
            .background(Color.gray.opacity(0))
            .cornerRadius(10)
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
