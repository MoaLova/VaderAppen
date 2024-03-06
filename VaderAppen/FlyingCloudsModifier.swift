//
//  FlyingCloudsModifier.swift
//  VaderAppen
//
//  Created by Moa.Svensson on 2024-03-05.
//

import Foundation
import SwiftUI

struct FlyingCloudsModifier: AnimatableModifier {
    var position: CGPoint
    var direction: CGFloat

    var animatableData: CGPoint {
        get { position }
        set { position = newValue }
    }

    func body(content: Content) -> some View {
        var position: CGPoint = self.position
        let direction: CGFloat = self.direction
        content
            .position(position)
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 2.0).repeatForever()) {
                    position.x += 200 * direction
                }
            }
    }
}
