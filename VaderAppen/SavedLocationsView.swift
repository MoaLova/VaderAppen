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
    
    @State private var selectedCloudPosition = 1 // Default value
    
    let locationSaved: [SavedLocation] = [
        // Your saved locations here
    ]
    
    // Function to save the selected city "Tokyo" to UserDefaults
    func saveSelectedCity() {
        UserDefaults.standard.set("Tokyo", forKey: "selectedCity")
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
                       if let savedCityString = UserDefaults.standard.string(forKey: "selectedCity"),
                          let savedCity = MeteoDataModel.City(rawValue: savedCityString) {
                           CloudView(locationSaved: SavedLocation(location: savedCity.rawValue),
                                     cloudPosition: $cloudPosition1,
                                     direction: CGFloat(UserDefaults.standard.integer(forKey: "selectedCloudPosition")))
                               .onTapGesture {
                                   self.showingAnotherView.toggle()
                               }
                       } else {
                           CloudView(locationSaved: locationSaved[0],
                                     cloudPosition: $cloudPosition1,
                                     direction: 1)
                               .onTapGesture {
                                   saveSelectedCity()
                                   self.showingAnotherView.toggle()
                               }
                           CloudView(locationSaved: locationSaved[1],
                                     cloudPosition: $cloudPosition2,
                                     direction: -1)
                               .onTapGesture {
                                   saveSelectedCity()
                                   self.showingAnotherView.toggle()
                               }
                           CloudView(locationSaved: locationSaved[2],
                                     cloudPosition: $cloudPosition3,
                                     direction: 1)
                               .onTapGesture {
                                   saveSelectedCity()
                                   self.showingAnotherView.toggle()
                               }
                           CloudView(locationSaved: locationSaved[3],
                                     cloudPosition: $cloudPosition4,
                                     direction: -1)
                               .onTapGesture {
                                   saveSelectedCity()
                                   self.showingAnotherView.toggle()
                               }
                           CloudView(locationSaved: locationSaved[4],
                                     cloudPosition: $cloudPosition5,
                                     direction: 1)
                               .onTapGesture {
                                   saveSelectedCity()
                                   self.showingAnotherView.toggle()
                               }
                       }
                   }
               }

               HStack {
                   ZStack {
                       Rectangle()
                           .stroke(Color.black, lineWidth: 3)
                           .frame(width: 100, height: 100)
                           .position(x: 80, y: 140)
                       
                       Button(action: {
                           self.showingAnotherView.toggle()
                       }) {
                           Image(systemName: "questionmark")
                               .resizable()
                               .foregroundColor(.black)
                               .frame(width: 80, height: 80)
                               .position(x: 80, y: 137)
                       }
                       .sheet(isPresented: $showingAnotherView) {
                           QuizView()
                       }
                   }

                   ZStack {
                       Rectangle()
                           .frame(width: 225, height: 55)
                           .position(x: 60, y: 116)
                       
                       TextField("Search location", text: $text)
                           .frame(width: 220, height: 50)
                           .background(Color.white)
                           .position(x: 60, y: 116)
                   }
               }
           }
       }
   }

struct SavedLocationsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedLocationsView()
    }
}


