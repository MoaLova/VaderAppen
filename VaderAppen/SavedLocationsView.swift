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

    @State private var cloudPosition1 = CGPoint(x: 200, y: -10)
    @State private var cloudPosition2 = CGPoint(x: 100, y: -10)
    @State private var cloudPosition3 = CGPoint(x: 0, y: -10)

    // Define locationSaved here
    let locationSaved: [SavedLocation] = [
        SavedLocation(location: "Malmö"),
        SavedLocation(location: "London"),
        SavedLocation(location: "Madrid")
    ]

    var body: some View {
        // Rest of your code
        VStack {
            HStack {
                Text("07.00")
                    .position(x: 50, y: 10)
            }

            Text("Saved locations")
                .position(x: 190, y: -120)
                .font(.title)

            ZStack {
                Rectangle()
                    .stroke(Color.black, lineWidth: 3)
                    .frame(width: 340, height: 550)
                    .foregroundColor(.white)
                    .position(x: 200, y: -10)

                VStack {
                    CloudView(locationSaved: locationSaved[0], cloudPosition: $cloudPosition1, direction: 1)
                    CloudView(locationSaved: locationSaved[1], cloudPosition: $cloudPosition2, direction: 1)
                    CloudView(locationSaved: locationSaved[2], cloudPosition: $cloudPosition3, direction: 1)
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
                        print("GoToQuizView")
                    }) {
                        Image(systemName: "questionmark")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 80, height: 80)
                            .position(x: 80, y: 140)
                    }
                    .sheet(isPresented: $showingAnotherView) {

                    } content: {
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


struct SavedLocationsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedLocationsView()
    }
}
