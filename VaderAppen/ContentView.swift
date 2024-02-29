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
    var body: some View{
        VStack{
            HStack{
                Text("07.00")
                
                Button(action: {
                    print("nein")
                    
                }){Text("Heart")}
                
            }
                
                
                
                
                Text("Location")
                
                
                Rectangle()
                
                    .stroke(Color.black, lineWidth: 3)
                    .frame(width: 340, height: 550)
                    .foregroundColor(.white)
                    .position(x: 200, y: 300)
                
                
                
                
                
                HStack{
                    
                    Rectangle()
                        .stroke(Color.black, lineWidth:3)
                        .frame(width: 100, height:100)
                        .position(x: 80, y: 300)
                    
                }
                
                
            }
            
            
            
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider{
        static var previews: some View{
            ContentView()
        }
    }
