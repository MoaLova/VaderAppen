//
//  SwiftUIView.swift
//  VaderAppen
//
//  Created by Leonardo.Ahlm on 2024-02-29.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var text: String = ""
    
    var body: some View {
        VStack{
            HStack{
                Text("07:00")
                    .position( x:50, y:10)
            
                Button(action: {
                    print("Button Tapped")
                }) {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .foregroundColor(.pink)
                        .frame(width: 50, height: 50)
                        .position( x:130, y:10)
                        
                }
            }
            
            ZStack{
                Rectangle()
                    .stroke(Color.black, lineWidth: 3)
                    .frame(width: 340, height: 550)
                
                
                VStack{
                    
                    Button(action:{
                        print("Button tapped")
                    }) {
                        Image(systemName: "icloud")
                            .resizable()
                            .foregroundColor(.blue)
                            .frame(width: 70, height: 50)
                        
                    }
                    
                    Button(action:{
                        print("Button tapped")
                    }) {
                        Image(systemName: "icloud")
                            .resizable()
                            .foregroundColor(.blue)
                            .frame(width: 70, height: 50)
                    }
                    
                    Button(action:{
                        print("Button tapped")
                    }) {
                        Image(systemName: "icloud")
                            .resizable()
                            .foregroundColor(.blue)
                            .frame(width: 70, height: 50)
                    }
                    
                    Button(action:{
                        print("Button tapped")
                    }) {
                        Image(systemName: "icloud")
                            .resizable()
                            .foregroundColor(.blue)
                            .frame(width: 70, height: 50)
                    }
                }
            }
            HStack(){
                
                ZStack{
                    Rectangle()
                        .stroke(Color.black, lineWidth: 3)
                        .frame(width: 100, height: 100)
                        .position(x:80, y:100)
                    
                    Button(action:{
                        print("Button tapped")
                    }) {
                        Image(systemName: "questionmark")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 80, height: 90)
                            .position(x:80, y:100)
                    }
                    
                    
                }
                
                ZStack{
                    
                    Rectangle()
                        .frame(width: 205, height: 55)
                        .position(x:65 , y:75)
                    
                    TextField("Search location", text: $text)
                        .frame(width: 200, height: 50)
                        .background(Color.white)
                        .position(x:65, y:75)
                    
                    
                }
                
            }
            
        }
        
    }
}

#Preview {
    SwiftUIView()
}
