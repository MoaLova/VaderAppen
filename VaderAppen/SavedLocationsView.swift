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

    let locationSaved: [SavedLocation] = [
        SavedLocation(location: "Malmö"),
        SavedLocation(location: "London"),
        SavedLocation(location: "Madrid"),
        SavedLocation(location: "Märsta"),
        SavedLocation(location: "Årsta")
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
                    .foregroundColor(.white)
                    .position(x: 200, y: -20)

                VStack {
                    CloudView(locationSaved: locationSaved[0], cloudPosition: $cloudPosition1, direction: 1)
                    CloudView(locationSaved: locationSaved[1], cloudPosition: $cloudPosition2, direction: -1)
                    CloudView(locationSaved: locationSaved[2], cloudPosition: $cloudPosition3, direction: 1)
                    CloudView(locationSaved: locationSaved[3], cloudPosition: $cloudPosition4, direction: -1)
                    CloudView(locationSaved: locationSaved[4], cloudPosition: $cloudPosition5, direction: 1)
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
                            .position(x: 80, y: 137)
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
}

struct SavedLocationsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedLocationsView()
    }
}
