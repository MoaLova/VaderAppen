//
//  ContentView.swift
//  VaderAppen
//
//  Created by Moa.Svensson on 2024-02-28.
//

//Hej
// nej
import SwiftUI
import CoreData

// Sample data model for hourly weather
struct HourlyWeather: Hashable {
    let time: String
    let temperature: String
    // Add more properties as needed
}

struct ContentView: View {
    
    @State private var hourlyWeatherData: [HourlyWeather] = []
    @State var showingAnotherView = false
    @State var showingAnotherView1 = false
    @State var text : String = ""
    
    var body: some View{
        VStack{
            HStack{
                Text("07.00")
                    .position(x:50, y: 10 )
                
                
                Button(action: {
                    self.showingAnotherView.toggle()
                    print("GoToSavedLocationView")
                    
                    
                }){Image(systemName: "goforward")
                        .resizable()
                        .foregroundColor(.pink)
                        .frame(width: 50, height: 50)
                        .position(x: 50, y: 15)
                    }
                .sheet(isPresented: $showingAnotherView) {
                    
                } content: {
                    SavedLocationsView()
                }
                
                
                Button(action: {
                    print("SaveToLocation")
                    
                }){Image(systemName: "heart.fill")
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
                            HourlyWeatherRow(hourlyWeather: hourlyWeather)
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(width: 360, height: 556)
                .clipped()
                .position(x: 200, y: -10)
            }
            
            HStack{
                NavigationView{
                    WeatherView()
            }
                ZStack{
                 Rectangle()
                    .stroke(Color.black, lineWidth: 3)
                    .frame(width: 100, height: 100)
                    .position(x:80, y:140)
                    
                    
                    Button(action:{
                        self.showingAnotherView1.toggle()
                        print("GoToQuizView")
                    
                      }) {
                    Image(systemName: "questionmark")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 80, height: 80)
                        .position(x:80, y:140)
                 }
                      .sheet(isPresented: $showingAnotherView1) {
                          
                      } content: {
                         QuizView()
                      }

            }
                
                ZStack{
                    
                    Rectangle()
                        .frame(width: 225, height: 55)
                        .position(x:60 , y:116)
                    
                    TextField("Search location", text: $text)
                        .frame(width: 220, height: 50)
                        .background(Color.white)
                        .position(x:60, y:116)
                    
                }
            }

            }
        .onAppear {
            // Fetch and populate hourly weather data
            fetchHourlyWeatherData()
        }
        }
    
    // Function to fetch hourly weather data
    private func fetchHourlyWeatherData() {
        // Replace this with your actual data fetching logic
        // For demo purposes, using dummy data
        hourlyWeatherData = [
            HourlyWeather(time: "07:00", temperature: "20°C"),
            HourlyWeather(time: "08:00", temperature: "22°C"),
            HourlyWeather(time: "09:00", temperature: "24°C"),
            // Add more data as needed
        ]
    }
}

// View for displaying hourly weather row
struct HourlyWeatherRow: View {
    let hourlyWeather: HourlyWeather
    
    var body: some View {
        HStack {
            Text(hourlyWeather.time)
            Spacer()
            Text(hourlyWeather.temperature)
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
