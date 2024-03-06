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
       
        HStack{
          Image(systemName: "icloud")
          .resizable()
            .foregroundColor(.blue)
            .frame(width: 140, height: 90)
            .overlay(
            Text(locationSaved.location)
            .foregroundColor(.black)
            .font(.headline)
           )
           
        }
    }
}

#Preview {
    SavedLocationItemView(locationSaved: SavedLocation(location: "location"))
}


