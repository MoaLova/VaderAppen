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

    var body: some View {
        Image(systemName: "cloud")
            .resizable()
            .foregroundColor(.blue)
            .frame(width: 160, height: 100)
            .overlay(
                Text(locationSaved.location)
                    .foregroundColor(.black)
                    .font(.title3)
                    .offset(y: 7) 
            )
            .modifier(FlyingCloudsModifier(position: $cloudPosition, direction: direction))
    }
}
