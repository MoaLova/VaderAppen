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

struct ContentView: View{
    
    @State var text : String = ""
    
    var body: some View{
        VStack{
            HStack{
                Text("07.00")
                    .position(x:50, y: 10 )
                
                
                Button(action: {
                    print("nein")
                    
                }){Image(systemName: "heart.fill")
                        .resizable()
                        .foregroundColor(.pink)
                        .frame(width: 50, height: 50)
                        .position(x: 130, y: 10)
                    }
                
            }
                
                
                Text("Location")
                .position(x: 190, y: -120)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
            ZStack {
                Rectangle()
                
                    .stroke(Color.black, lineWidth: 3)
                    .frame(width: 340, height: 556)
                    .foregroundColor(.white)
                    .position(x: 200, y: -10)
                
                ScrollView {
                    VStack(spacing: 10){
                        ForEach(0...1, id: \.self) { index in
                            Rectangle()
                                .fill(Color.gray)
                                .cornerRadius(8)
                                .frame(maxWidth: .infinity)
                                .frame(height: 530)
                                .padding(.horizontal)
                        }
                    }
                    .padding(.vertical)
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
                    print("Button tapped")
                      }) {
                    Image(systemName: "questionmark")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 80, height: 80)
                        .position(x:80, y:140)
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
        
        }
    }
    
    struct ContentView_Previews: PreviewProvider{
        static var previews: some View{
            ContentView()
        }
    }
