//
//  AddLocationView.swift
//  VaderAppen
//
//  Created by Elin.Andersson on 2024-03-12.
//

import Foundation
import SwiftUI
struct AddLocationView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var locationName: String = ""

    var body: some View {
        VStack {
            TextField("Location Name", text: $locationName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Save") {
                let newLocation = Location(context: viewContext)
                newLocation.location = locationName

                do {
                    try viewContext.save()
                } catch {
                    // Handle the error appropriately
                    print(error.localizedDescription)
                }
            }
        }
    }
}
