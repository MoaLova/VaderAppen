//
//  VaderAppen
//
//  Created by Leonardo.Ahlm on 2024-02-29.
//

import SwiftUI
import Foundation


struct SavedLocationsView: View {
    @State var showingAnotherView = false
    @State var text: String = ""
    @State private var cloudPosition1 = CGPoint(x: 100, y: -240)
        @State private var cloudPosition2 = CGPoint(x: 300, y: -170)
        @State private var cloudPosition3 = CGPoint(x: 100, y: -100)
        @State private var cloudPosition4 = CGPoint(x: 300, y: -30)
        @State private var cloudPosition5 = CGPoint(x: 100, y: 40)

    // Function to retrieve saved cities from UserDefaults
    var savedCities: [String] {
        UserDefaults.standard.array(forKey: "selectedCities") as? [String] ?? []
    }

    var body: some View {
        VStack {
            HStack {
                Text("07.00")
                    .position(x: 50, y: 10)
            }

            Text("Saved locations")
                .position(x: 190, y: -140)
                .font(.title)

            ZStack {
                Rectangle()
                    .stroke(Color.black, lineWidth: 3)
                    .frame(width: 340, height: 550)
                    .background(.blue)
                    .position(x: 200, y: -20)
                
                VStack {
                    ForEach(savedCities.indices, id: \.self) { index in
                                           CloudView(locationSaved: SavedLocation(location: savedCities[index]), cloudPosition: bindingForCloudPosition(index), direction: 1)
                                               .onTapGesture {
                           
                                // Handle tap action here
                                // For example, navigate to details view for the selected city
                            }
                    }
                }
                .sheet(isPresented: $showingAnotherView) {
                    ContentView()
                }
            }
        }
    }

    // Function to determine cloud position based on city index
    private func bindingForCloudPosition(_ index: Int) -> Binding<CGPoint> {
        switch index {
        case 0: return $cloudPosition1
        case 1: return $cloudPosition2
        case 2: return $cloudPosition3
        case 3: return $cloudPosition4
        case 4: return $cloudPosition5
        default: return .constant(.zero)
        }
    }
}

struct SavedLocationsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedLocationsView()
    }
}

