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
    let onTap: () -> Void 

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
                onTap()
            })
                    
                    
                }
            }
    

