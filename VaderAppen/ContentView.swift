//
//  ContentView.swift
//  VaderAppen
//
//  Created by Moa.Svensson on 2024-02-28.
//att göra: //Använd @FetchRequest för att hämta data från din Core Data-stack och @Environment(\.managedObjectContext) för att få tillgång till managedObjectContext som krävs för att skapa eller modifiera entiteter.
//Skapa en tjänstklass i ditt projekt som hanterar nätverksanrop till OpenWeatherMap API. Använd URLSession för att utföra dessa anrop och decodera svaret med hjälp av JSONDecoder.


import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            WeatherView()
                .navigationTitle("Weather Me")
            Button("Get weather"){
                
            }
        }
    }
}



//struct ContentView: View {
//    @State var weather: String = ""
//    @State var cityName: String = ""
//    @State var temperature: String = ""
    //@State var description: String = ""
    
//    var body: some View {
//        VStack{
//            Text(cityName)
//                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                .padding()
////            Text(description)
////                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
////                .padding()
//            Text(temperature)
//                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                .padding()
//            Text(weather)
//                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                .padding()
//            Button("get weather"){
//            }
//        }
//    }
//}
//api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=3c73acdc0f41c548c2a6b2bf65f0fa97
