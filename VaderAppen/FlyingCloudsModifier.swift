//
//  CloudModifier.swift
//  VaderAppen
//
//  Created by Moa.Svensson on 2024-03-07.
//

import Foundation
import SwiftUI
struct FlyingCloudsModifier: AnimatableModifier {
    @Binding var position: CGPoint
    var direction: CGFloat

    var animatableData: CGPoint {
        get { position }
        set { position = newValue }
    }

    func body(content: Content) -> some View {
        content
            .position(position)
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 2.0).repeatForever()) {
                    var newPosition = self.position
                    newPosition.x += 200 * self.direction
                    self.position = newPosition
                }
            }
    }
}
