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
    @State private var cloudPosition1 = CGPoint(x: 100, y: -350)
    @State private var cloudPosition2 = CGPoint(x: 300, y: -300)
    @State private var cloudPosition3 = CGPoint(x: 100, y: -250)
    @State private var cloudPosition4 = CGPoint(x: 300, y: -200)
    @State private var cloudPosition5 = CGPoint(x: 100, y: -150)
    @State var selectedCity: String?
   
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
                           CloudView(locationSaved: SavedLocation(location: savedCities[index]), cloudPosition: bindingForCloudPosition(index), direction: index % 2 == 0 ? 1 : -1) {
                               self.showingAnotherView.toggle()
                               self.selectedCity = savedCities[index]
                           }
                           .gesture(longPressToDelete(index))
                           .onTapGesture {
                               // Handle tap action here
                               // For example, navigate to details view for the selected city
                               self.showingAnotherView.toggle()
                           }
                       }
                   }
                   .sheet(isPresented: $showingAnotherView) {
                       ContentView(selectedCity: $selectedCity)
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
       
       // Function to create long press gesture for cloud deletion
       private func longPressToDelete(_ index: Int) -> some Gesture {
           return LongPressGesture(minimumDuration: 0.5)
               .onEnded { _ in
                   let cityToRemove = savedCities[index]
                   let alert = UIAlertController(title: "Confirm Deletion", message: "Are you sure you want to delete \(cityToRemove)?", preferredStyle: .alert)
                   alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                   alert.addAction(UIAlertAction(title: "Delete", style: .destructive) { _ in
                       var updatedCities = savedCities
                       updatedCities.remove(at: index)
                       UserDefaults.standard.set(updatedCities, forKey: "selectedCities")
                   })
                   UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
               }
       }
   }
struct SavedLocationsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedLocationsView(selectedCity:("Stockholm"))
    }
}
