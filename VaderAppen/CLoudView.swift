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
    var direction: CGFloat

    var body: some View {
        Image(systemName: "cloud")
            .resizable()
            .foregroundColor(.blue)
            .frame(width: 40, height: 40)
            .overlay(
                Text(locationSaved.location)
                    .foregroundColor(.black)
                    .font(.headline)
            )
            .modifier(FlyingCloudsModifier(position: CGPoint(x: 200, y: -10), direction: direction))
    }
}
