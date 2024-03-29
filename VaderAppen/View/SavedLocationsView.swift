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
    @State  var cloudPosition1 = CGPoint(x: 100, y: -350)
    @State  var cloudPosition2 = CGPoint(x: 300, y: -300)
    @State  var cloudPosition3 = CGPoint(x: 100, y: -250)
    @State  var cloudPosition4 = CGPoint(x: 300, y: -200)
    @State  var cloudPosition5 = CGPoint(x: 100, y: -150)
    @State var selectedCity: String?
    
    var savedCities: [String] {
        UserDefaults.standard.array(forKey: "selectedCities") as? [String] ?? []
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("")
                    .position(x: 50, y: 10)
            }
            
            Text("Saved locations")
                .position(x: 190, y: -220)
                .font(.title)
            
            ZStack {
                Rectangle()
                    .stroke(Color.black, lineWidth: 3)
                    .frame(width: 340, height: 550)
                    .background(Color.blue)
                    .position(x: 200, y: -140)
                
                VStack {
                    ForEach(0..<min(savedCities.count, 5), id: \.self) { index in
                        HStack {
                            CloudView(locationSaved: SavedLocation(location: savedCities[index]), cloudPosition: bindingForCloudPosition(index), direction: index % 2 == 0 ? 1 : -1) {
                                self.showingAnotherView.toggle()
                                self.selectedCity = savedCities[index]
                            }
                            .onTapGesture {
                                self.showingAnotherView.toggle()
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                let viewModel = SavedLocationsViewModel()
                                viewModel.removeCity(at: index)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
            }.sheet(isPresented: $showingAnotherView) {
                ContentView(selectedCity: $selectedCity)
            }
        }
    }

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
        SavedLocationsView(selectedCity:("Stockholm"))
    }
}


