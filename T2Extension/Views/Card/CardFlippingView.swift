//
//  CardFlippingView.swift
//  T2Extension
//
//  Created by 大畑允人 on 2022/01/01.
//

import SwiftUI

struct CardFlippingView: View {

      @State private var flipped = false
      @State private var animate3d = false

      var body: some View {
          GeometryReader { geometry in
              ZStack() {
                    CardFrontView()
                      .frame(width: geometry.size.width, height: geometry.size.height)
                      .opacity(flipped ? 0.0 : 1.0)
                    CardBackView()
                      .frame(width: geometry.size.width, height: geometry.size.height)
                      .opacity(flipped ? 1.0 : 0.0)
              }
              .shadow(color: .secondary, radius: 15)
              .modifier(CardFlipEffect(flipped: $flipped, angle: animate3d ? 180 : 0, axis: (x: 0, y: -1)))
              .onTapGesture {
                    withAnimation(Animation.linear(duration: 0.8)) {
                          self.animate3d.toggle()
                    }
              }
          }
      }
}

struct CardFlipEffect: GeometryEffect {

      var animatableData: Double {
            get { angle }
            set { angle = newValue }
      }

      @Binding var flipped: Bool
      var angle: Double
      let axis: (x: CGFloat, y: CGFloat)

      func effectValue(size: CGSize) -> ProjectionTransform {

            DispatchQueue.main.async {
                  self.flipped = self.angle >= 90 && self.angle < 270
            }

            let tweakedAngle = flipped ? -180 + angle : angle
            let a = CGFloat(Angle(degrees: tweakedAngle).radians)

            var transform3d = CATransform3DIdentity;
          transform3d.m34 = -0.5/max(size.width, size.height)

            transform3d = CATransform3DRotate(transform3d, a, axis.x, axis.y, 0)
            transform3d = CATransform3DTranslate(transform3d, -size.width/2.0, -size.height/2.0, 0)

            let affineTransform = ProjectionTransform(CGAffineTransform(translationX: size.width/2.0, y: size.height / 2.0))

            return ProjectionTransform(transform3d).concatenating(affineTransform)
      }
}

struct CardFlippingView_Previews: PreviewProvider {
    static var previews: some View {
        CardFlippingView()
            .frame(width: 300, height: 200)
    }
}