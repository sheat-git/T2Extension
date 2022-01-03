//
//  CardFlippingView.swift
//  T2Extension
//
//  Created by 大畑允人 on 2022/01/01.
//

import SwiftUI

struct CardFlippingView: View {
    
    @Binding var account: String
    @Binding var password: String
    
    @Binding var row1: String
    @Binding var row2: String
    @Binding var row3: String
    @Binding var row4: String
    @Binding var row5: String
    @Binding var row6: String
    @Binding var row7: String

    @State private var flipped = false
    @State private var animate3d = false

    var body: some View {
        GeometryReader { geometry in
            ZStack() {
                CardFrontView(account: $account, password: $password)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(flipped ? 0.0 : 1.0)
                CardBackView(row1: $row1, row2: $row2, row3: $row3, row4: $row4, row5: $row5, row6: $row6, row7: $row7)
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
    
    @State static var account = "20B00000"
    @State static var password = "abcd1234"
    
    @State static var row1: String = String.randomUppercase(length: 10)
    @State static var row2: String = String.randomUppercase(length: 10)
    @State static var row3: String = String.randomUppercase(length: 10)
    @State static var row4: String = String.randomUppercase(length: 10)
    @State static var row5: String = String.randomUppercase(length: 10)
    @State static var row6: String = String.randomUppercase(length: 10)
    @State static var row7: String = String.randomUppercase(length: 10)
    
    static var previews: some View {
        CardFlippingView(account: $account, password: $password, row1: $row1, row2: $row2, row3: $row3, row4: $row4, row5: $row5, row6: $row6, row7: $row7)
            .frame(width: 300, height: 200)
    }
}
