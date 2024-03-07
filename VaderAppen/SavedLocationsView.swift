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
    @State var locationSaved: [SavedLocation] = [
        SavedLocation(location: "Malmö"),
        SavedLocation(location: "London"),
        SavedLocation(location: "Madrid")
    ]

    var body: some View {
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
                    ForEach(locationSaved.indices, id: \.self) { index in
                        CloudView(locationSaved: locationSaved[index], direction: 1)
                            .modifier(FlyingCloudsModifier(position: CGPoint(x: 200 * CGFloat(index), y: -10), direction: CGFloat(index % 2 == 0 ? 1 : -1)))
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
}

struct SavedLocationsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedLocationsView()
    }
}
