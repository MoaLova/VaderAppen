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
    @State private var selectedCityIndex: Int? // Use an optional Int for selectedCityIndex

    @State private var cloudPositions: [CGPoint] = [
        CGPoint(x: 100, y: -240),
        CGPoint(x: 300, y: -170),
        CGPoint(x: 100, y: -100),
        CGPoint(x: 300, y: -30),
        CGPoint(x: 100, y: 40)
    ]

    let locationSaved: [SavedLocation] = [
        SavedLocation(location: ""),
        SavedLocation(location: ""),
        SavedLocation(location: ""),
        SavedLocation(location: ""),
        SavedLocation(location: "")
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
                    ForEach(locationSaved.indices, id: \.self) { index in
                        CloudView(locationSaved: locationSaved[index],
                                  cloudPosition: $cloudPositions[index],
                                  direction: index % 2 == 0 ? 1 : -1)
                            .onTapGesture {
                                // Set the third index of selectedCityIndex to display in the first cloud position
                                self.selectedCityIndex = 2
                                self.showingAnotherView.toggle()
                            }
                    }
                }
                .sheet(isPresented: $showingAnotherView) {
                    ContentView()
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

