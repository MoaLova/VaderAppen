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
    
    @State private var selectedCloudPosition1 = 0
    @Binding var selectedCloudPosition: Int// Default value
    
    @State private var cloudPositions = [
        CGPoint(x: 100, y: -240),
        CGPoint(x: 300, y: -170),
        CGPoint(x: 100, y: -100),
        CGPoint(x: 300, y: -30),
        CGPoint(x: 100, y: 40)

    ]
    
    let locationSaved: [SavedLocation] = [
        
    ]
    
   
    
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
                            let savedCloudPosition = UserDefaults.standard.integer(forKey: "selectedCloudPosition")
                            
                            // Find the index of the savedCity in locationSaved array
                            if let savedCityIndex = locationSaved.firstIndex(where: { $0.location == savedCity.rawValue }) {
                                // Use the savedCloudPosition to determine which cloud position to use
                                CloudView(locationSaved: locationSaved[savedCityIndex],
                                          cloudPosition: $cloudPositions[savedCloudPosition],
                                          direction: CGFloat(savedCloudPosition))
                                    .onTapGesture {
                                        self.showingAnotherView.toggle()
                                    }
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
        
           .onAppear {
                       print("Selected Cloud Position:", selectedCloudPosition)
                   }
        
       }
   }


struct SavedLocationsView_Previews: PreviewProvider {
    @State static var selectedCloudPosition = 0
    static var previews: some View {
        SavedLocationsView(selectedCloudPosition: $selectedCloudPosition)
        
    }
}



