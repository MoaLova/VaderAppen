//
//  CLoudView.swift
//  VaderAppen
//
//  Created by Moa.Svensson on 2024-03-07.
//


import Foundation
import SwiftUI

struct CloudView: View {
    var locationSaved: SavedLocation
    @Binding var cloudPosition: CGPoint
    var direction: CGFloat
    let onTap: () -> Void // Closure for tap action

    var body: some View {
        Image(systemName: "cloud.fill")
            .resizable()
            .foregroundColor(.white)
            .frame(width: 160, height: 100)
            .overlay(
                Text(locationSaved.location)
                    .foregroundColor(.black)
                    .font(.title2)
                    .offset(y: 7)
            )
       
            
            .modifier(FlyingCloudsModifier(position: $cloudPosition, direction: direction))
            .gesture(TapGesture().onEnded {
                onTap() // Call onTap closure when tapped
            })
                    // Navigate to the respective city in ContentView
                    // You might need to implement navigation here based on your app's navigation structure
                    // For example, you can pass the city name to ContentView and update the state to display the respective city
                    // This is just a placeholder, you need to adjust it according to your app's structure
                    
                }
            }
    

