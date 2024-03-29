
//
//  ContentView.swift
//  VaderAppen
//
//  Created by Moa.Svensson on 2024-02-28.

//          Bygd i MVVM
//Grupp 3: Leonardo,Moa,Lucas,Elin,Alex,Ibrahim


import CoreData
import SwiftUI
import CoreLocation

struct ContentView: View {
    @State private var citys: [MeteoDataModel.City] = []
       @State private var hourlyWeatherData: [MeteoDataModel.WeatherData] = []
       @State private var currentUnitsData: [MeteoDataModel.Current] = []
       @State private var currentCity = MeteoDataModel.City.custom
       @State private var isLoading = false
       @State private var meteoDataModel = MeteoDataModel()
    @State private var meteoViewModel = MeteoViewModel()
       @State private var text: String = ""
       @Binding var selectedCity: String?  
       @State private var latitudeText = ""
       @State private var longitudeText = ""
       @State private var cityName: String = ""
       @State var showingAnotherView = false
       @State var showingAnotherView1 = false
        var contentViewModel = ContentViewModel()
    
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                self.showingAnotherView.toggle()
                print("GoToSavedLocationView")


                    }){Image(systemName: "globe.europe.africa.fill")
                        .resizable()
                        .foregroundColor(.blue)
                        .frame(width: 50, height: 50)
                        .position(x: 60, y: 28)
                                    }
                    .sheet(isPresented: $showingAnotherView) {
                        SavedLocationsView()
                    }
                
                Picker("Select City", selection: $currentCity) {
                    ForEach(MeteoDataModel.City.allCases, id: \.self) { city in
                        if city == .custom {
                            Text(cityName)
                        } else {
                            Text(city.rawValue.capitalized)
                        }
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .position(CGPoint(x: 50.0, y: 28.0))
                .onChange(of: currentCity) { _ in
                    isLoading = true
                    fetchHourlyWeatherData(currentCity)
                    print("selected\(currentCity)")
                }
                
                Button(action: {
                    self.showingAnotherView1.toggle()
                }) {
                    Image(systemName: "questionmark")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 40, height: 40)
                        .background(Color.white)
                        .position(x: 40, y: 28)
                        .sheet(isPresented: $showingAnotherView1) {
                            QuizView()
                        }
                }
                
                Button(action: {
                    contentViewModel.saveSelectedCity(currentCity)
                }) {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .foregroundColor(.pink)
                        .frame(width: 50, height: 50)
                        .position(CGPoint(x: 35.0, y: 28.0))
                }
                
            }
            
            ZStack {
                Rectangle()
                    .stroke(Color.black, lineWidth: 3)
                    .frame(width: 350, height: 600)
                    .foregroundColor(.white)
                    .position(x: 200, y: 210)
                
                
                LazyVStack(spacing: 10) {
                    ForEach(hourlyWeatherData, id: \.self) { hourlyWeather in
                        HourlyWeatherRow(hourlyWeather: hourlyWeather, currentCity: currentCity )
                    }
                }
                .position(CGPoint(x: 200.0, y: -20.0))
                
            }
            
            ZStack {
                Text("Hourly:")
                    .position(CGPoint(x: 180.0, y: -70.0))
                    .font(.custom("Copperplate", size: 24))
                Image(systemName: "cloud")
                    .resizable()
                    .frame(width: 340, height: 180)
                    .foregroundColor(.blue)
                    .overlay(
                        Image(systemName: "cloud")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 325, height: 160)
                    )
                    .position(CGPoint(x: 200.0, y: -30.0))
                
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(hourlyWeatherData, id: \.self) { hourlyWeather in
                            HourlyWeather(hourlyWeather: hourlyWeather, currentCity: currentCity)
                        }
                    }
                }
                .frame(width: 250, height: 100)
                .position(CGPoint(x: 210.0, y: 0.0))
            }
            
            ZStack {
                Rectangle()
                    .stroke(Color.black, lineWidth: 3)
                    .frame(width: 320, height: 260)
                    .foregroundColor(.white)
                    .position(CGPoint(x: 200.0, y: 50.0))
                
                Text("Forecast 7-days")
                    .position(CGPoint(x: 200.0, y: -55.0))
                    .font(.custom("Copperplate", size: 28))
                
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(hourlyWeatherData, id: \.self) { hourlyWeather in
                            DailyWeather(hourlyWeather: hourlyWeather, currentCity: currentCity)
                        }
                    }
                }
                .frame(width: 320, height: 220)
                .position(CGPoint(x: 200.0, y: 60.0))
            }
            
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2)
                
            }
            
            
            ZStack {
                Rectangle()
                    .frame(width: 225, height: 35)
                    .position(x: 200, y: 80)
                
                Rectangle()
                    .frame(width: 225, height: 35)
                    .position(x: 200, y: 130)
                
                TextField("Add Latitude", text:$latitudeText)
                    .frame(width: 220, height: 30)
                    .background(Color.white)
                    .position(x: 200, y: 80)
                
                TextField("Add Longitude", text: $longitudeText)
                    .frame(width: 220, height: 30)
                    .background(Color.white)
                    .position(x: 200, y: 130)
                
                Button(action: {
                    if let latitude = Double(latitudeText), let longitude = Double(longitudeText) {
                        MeteoDataModel.City
                            .customLatitudeValue = latitude
                        MeteoDataModel.City.customLongitudeValue = longitude
                        
                        isLoading = true
                        fetchHourlyWeatherData(.custom)
                        
                        fetchCityName()
                    } else {
                        print("Invalid latitude or longitude")
                    }
                }, label: {
                    Text("Show location")
                })
                .position(x: 200, y:105)
            }
        }
        
        .onAppear {
            if let selectedCity = selectedCity {
                currentCity = MeteoDataModel.City(rawValue: selectedCity) ?? .custom
                isLoading = true
                fetchHourlyWeatherData(currentCity)
            }
            
        }
        
    }
  
    
    
    
    // Den här funcen tillhör inom mvvm en ViewModel men vi får det inte funka att visa stadens namn ifall vi flyttar in den i en ViewModel
    
    func fetchCityName() {
        guard let latitude = Double(latitudeText),
              let longitude = Double(longitudeText) else {
            print("Invalid latitude or longitude")
            return
        }
        
        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            guard let placemark = placemarks?.first else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let city = placemark.locality {
                self.cityName = city
            } else {
                self.cityName = "City not found"
            }
        }
    }
    
    private func fetchHourlyWeatherData(_ currentCity: MeteoDataModel.City) {
        print("fetch hourly jnlne print \(currentCity)")
        meteoViewModel.fetchWeatherData(currentCity) { fetchedWeatherData in
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
        VStack {
            ForEach(hourlyWeather.hourly.time.indices, id: \.self) { index in
                if currentCity == .custom {
                    Text("Time: \(hourlyWeather.hourly.time[index]): ")
                        .font(.custom("Copperplate", size: 20))
                        .padding(.top)
                    
                    Text("Temperature: \(String(format: "%.2f", hourlyWeather.hourly.temperature_2m[index])) °C")
                        .font(.custom("Copperplate", size: 20))
                    
                    Text("Humidity: \(String(format: "%.2f", hourlyWeather.hourly.relative_humidity_2m[index])) %")
                        .font(.custom("Copperplate", size: 20))
                    
                    Text("Precipitation: \(String(format: "%.2f", hourlyWeather.hourly.precipitation[index])) mm")
                        .font(.custom("Copperplate", size: 20))
                    
                    Text("UV-index: \(String(format: "%.2f", hourlyWeather.hourly.uv_index[index])) ")
                        .font(.custom("Copperplate", size: 20))
                    
                    Text("Wind \(String(format: "%.2f", hourlyWeather.hourly.wind_speed_10m[index])) m/s")
                        .font(.custom("Copperplate", size: 20))
                        .padding(.bottom)
                } else {
                    HourlyWeatherRow(hourlyWeather: hourlyWeather, currentCity: currentCity)
                }
                Divider()
            }
        }
    }
}

struct DailyWeather: View {
    let hourlyWeather: MeteoDataModel.WeatherData
    let currentCity: MeteoDataModel.City
    
    var body: some View {
        VStack {
            ForEach(hourlyWeather.daily.time.indices, id: \.self) { index in
                if currentCity == .custom {
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
                } else {
                    HourlyWeatherRow(hourlyWeather: hourlyWeather, currentCity: currentCity)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    @State static var selectedCity: String? = ""

    static var previews: some View {
        ContentView(selectedCity: $selectedCity)
    }
}
