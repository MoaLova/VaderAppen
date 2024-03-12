//
//  SavedLocationListView.swift
//  VaderAppen
//
//  Created by Elin.Andersson on 2024-03-12.
//

import Foundation
import SwiftUI
import CoreData

// Definierar en SwiftUI-vy som heter LocationsListView
struct LocationsListView: View {
    // Använder @FetchRequest för att hämta Location-entiteter från CoreData.
    // Sorterar dessa entiteter baserat på 'name'-attributet i stigande ordning.
    @FetchRequest(
        entity: Location.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Location.location, ascending: true)]
    ) var locations: FetchedResults<Location>  // Lagrar de hämtade resultaten i en variabel som heter 'locations'.

    // Bodyn av LocationsListView som innehåller UI-komponenterna.
    var body: some View {
        List(locations, id: \.self) { location in  // Skapar en lista där varje rad representerar en Location från 'locations'-resultatet.
            Text(location.location ?? "Unknown")  // Visar 'name'-attributet för varje Location. Om 'name' är nil, visas "Unknown".
        }
    }
}

// Förhandsgranskningskonfiguration för att se hur vyn ser ut i Xcode:s förhandsgranskningspanel.
struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        // Wrappar LocationsListView inuti en NavigationView för en realistisk förhandsgranskning.
        // Detta kan vara speciellt användbart om LocationsListView används inuti en navigationstack.
        NavigationView {
            LocationsListView()
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
                // Injectar en instans av NSManagedObjectContext till vyns miljö.
                // Använder PersistenceController.preview för förhandsgranskning, vilket är en temporär instans av PersistenceController.
        }
    }
}
