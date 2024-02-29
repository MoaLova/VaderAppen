//
//  SwiftUIView.swift
//  VaderAppen
//
//  Created by Leonardo.Ahlm on 2024-02-29.
//

import SwiftUI

struct SwiftUIView: View{
    
    @State var text : String = ""
    
    var body: some View{
        VStack{
            HStack{
                Text("07.00")
                    .position(x:50, y: 10 )
                
                
                Button(action: {
                    print("nein")
                    
                }){Image(systemName: "cloud.sun")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 70, height: 50)
                        .position(x: 130, y: 10)
                    }
                
            }
                
                
                Text("Saved locations")
                .position(x: 190, y: -120)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
            ZStack{
                
                
                Rectangle()
                
                    .stroke(Color.black, lineWidth: 3)
                    .frame(width: 340, height: 550)
                    .foregroundColor(.white)
                    .position(x: 200, y: -10)
                
                Button(action:{
                    print("Tapped")
                }) {
                    Image(systemName:"icloud")
                        .resizable()
                        .foregroundColor(.blue)
                        .frame(width: 100, height: 80)
                        .position(x:200, y: -10)
                }
                
                
                
                
            }
            
            HStack{
                
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

#Preview {
    SwiftUIView()
}

