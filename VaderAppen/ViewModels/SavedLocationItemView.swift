//
//  SavedLocationItemView.swift
//  VaderAppen
//
//  Created by Moa.Svensson on 2024-03-01.
//

import SwiftUI

    
struct SavedLocationItemView: View {
    
    @State var locationSaved: SavedLocation
    
    var body: some View{
        ZStack {
            Image(systemName: "icloud")
                .resizable()
                .foregroundColor(.blue)
                .frame(width: 140, height: 90)
            
            Text(locationSaved.location)
                .foregroundColor(.black)
                .font(.title3)
                .offset(y: 7) 
        }
    }
}

