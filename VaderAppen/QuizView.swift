//
//  QuizView.swift
//  VaderAppen
//
//  Created by Leonardo.Ahlm on 2024-02-29.
//

import SwiftUI

struct QuizView: View {
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
                
                
                Text("Weather Quiz")
                .position(x: 190, y: -180)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
            ZStack{
                
                
                Rectangle()
                
                    .stroke(Color.black, lineWidth: 3)
                    .frame(width: 340, height: 600)
                    .foregroundColor(.white)
                    .position(x: 196, y: -100)
                
                Image(systemName: "rainbow")
                    .resizable()
                    .frame(width: 300, height: 150)
                    .position(x: 200, y: -300)
                    .symbolRenderingMode(.multicolor)
                
                
                Button(action:{
                    print("Tapped")
                }) {
                    Image(systemName:"sun.max.fill")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 100, height: 100)
                        .position(x:100, y: -160)
                }
                
                Button(action:{
                    print("Tapped")
                }) {
                    Image(systemName:"drop.fill")
                        .resizable()
                        .foregroundColor(.blue)
                        .frame(width: 60, height: 70)
                        .position(x:100, y: -60)
                }
                
                Button(action:{
                    print("Tapped")
                }) {
                    Image(systemName:"wind")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 80, height: 80)
                        .position(x:100, y: 40)
                }
                
                Button(action:{
                    print("Tapped")
                }) {
                    Image(systemName:"icloud.fill")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: 100, height: 80)
                        .position(x:100, y: 140)
                }
            
            }
    
            }
        }
}

#Preview {
    QuizView()
}
