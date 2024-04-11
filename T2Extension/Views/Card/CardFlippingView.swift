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

    @State private var isFlipped = false
    
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                CardFrontView(account: $account, password: $password)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .modifier(FlipOpacity(percentage: isFlipped ? 0 : 1))
                    .rotation3DEffect(.degrees(isFlipped ? 180 : 360), axis: (0, 1, 0), perspective: 0.5)
                CardBackView(row1: $row1, row2: $row2, row3: $row3, row4: $row4, row5: $row5, row6: $row6, row7: $row7)
                    .modifier(FlipOpacity(percentage: isFlipped ? 1 : 0))
                    .rotation3DEffect(.degrees(isFlipped ? 0 : 180), axis: (0, 1, 0), perspective: 0.5)
            }
            .shadow(color: .secondary, radius: colorScheme == .light ? 15 : 0)
            .onTapGesture {
                withAnimation(Animation.linear(duration: 0.8)) {
                    self.isFlipped.toggle()
                }
            }
        }
    }
}

private struct FlipOpacity: AnimatableModifier {
    var percentage: CGFloat = 0

    var animatableData: CGFloat {
        get { percentage }
        set { percentage = newValue }
    }

    func body(content: Content) -> some View {
        content
            .opacity(Double(percentage.rounded()))
    }
}

struct CardFlippingView_Previews: PreviewProvider {
    @State static var account = "20B00000"
    @State static var password = "abcd1234"

    @State static var row1: String = .randomUppercase(length: 10)
    @State static var row2: String = .randomUppercase(length: 10)
    @State static var row3: String = .randomUppercase(length: 10)
    @State static var row4: String = .randomUppercase(length: 10)
    @State static var row5: String = .randomUppercase(length: 10)
    @State static var row6: String = .randomUppercase(length: 10)
    @State static var row7: String = .randomUppercase(length: 10)

    static var previews: some View {
        CardFlippingView(account: $account, password: $password, row1: $row1, row2: $row2, row3: $row3, row4: $row4, row5: $row5, row6: $row6, row7: $row7)
            .frame(width: 300, height: 200)
    }
}
