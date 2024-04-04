//
//  GuideView.swift
//  T2Extension
//
//  Created by 大畑允人 on 2022/01/26.
//

import SwiftUI

struct GuideView: View {
    var cardHeight: CGFloat
    var cardWidth: CGFloat
    var padHeight: CGFloat

    @Environment(\.dismiss) var dismiss
    @State private var selection = 0

    var body: some View {
        GeometryReader { geometry in

            VStack(spacing: 0) {
                HStack {
                    Spacer()

                    Button("\(Image(systemName: "xmark.circle"))") {
                        dismiss()
                    }
                    .buttonStyle(GuideButtonStyle(fontStyle: .system(size: cardHeight / 11, weight: .medium, design: .default)))
                }
                .frame(width: geometry.size.width * 0.9)
                .padding(.top, padHeight * 2)

                Text("Guide")
                    .font(.system(size: cardHeight / 6, weight: .bold, design: .default))
                    .frame(width: geometry.size.width * 0.9, alignment: .leading)

                Picker("guideMode", selection: self.$selection) {
                    Text("Extension")
                        .tag(0)
                    Text("Matrix Code")
                        .tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                ZStack {
                    #if targetEnvironment(macCatalyst)
                        GuideMacView()
                            .opacity(1 - Double(selection))
                    #else
                        GuideiPhoneView()
                            .opacity(1 - Double(selection))
                    #endif

                    GuideEditView()
                        .opacity(Double(selection))
                }
                .animation(.default, value: selection)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in

            let cardHeight = min(geometry.size.width * 0.6, geometry.size.height * 0.5)
            let cardWidth = min(geometry.size.width * 0.9, geometry.size.height * 0.75)
            let padHeight = min(geometry.size.width * 0.8, geometry.size.height * 0.25) / 30

            GuideView(cardHeight: cardHeight, cardWidth: cardWidth, padHeight: padHeight)
        }
    }
}
