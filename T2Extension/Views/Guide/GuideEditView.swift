//
//  GuideEditView.swift
//  T2Extension
//
//  Created by 大畑允人 on 2022/01/02.
//

import SwiftUI

struct GuideEditView: View {
    @State private var row1: String = .randomUppercase(length: 10)
    @State private var row2: String = .randomUppercase(length: 10)
    @State private var row3: String = .randomUppercase(length: 10)
    @State private var row4: String = .randomUppercase(length: 10)
    @State private var row5: String = .randomUppercase(length: 10)
    @State private var row6: String = .randomUppercase(length: 10)
    @State private var row7: String = .randomUppercase(length: 10)

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()

                VStack(alignment: .leading) {
                    Text("For a Matrix Code like below")

                    CardBackMatrixView(row1: $row1, row2: $row2, row3: $row3, row4: $row4, row5: $row5, row6: $row6, row7: $row7)
                        .frame(width: min(geometry.size.width * 0.7, geometry.size.height * 0.5), height: min(geometry.size.width * 0.5, geometry.size.height * 0.3))

                    Text("Fill TextField like below")

                    GuideEditMatrixView(row1: $row1, row2: $row2, row3: $row3, row4: $row4, row5: $row5, row6: $row6, row7: $row7)
                        .frame(width: min(geometry.size.width * 0.7, geometry.size.height * 0.5))
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.accentColor, lineWidth: 4))
                }
                .frame(width: geometry.size.width)

                Spacer()
            }
        }
    }
}

struct GuideEditMatrixView: View {
    @Binding var row1: String
    @Binding var row2: String
    @Binding var row3: String
    @Binding var row4: String
    @Binding var row5: String
    @Binding var row6: String
    @Binding var row7: String

    var body: some View {
        List {
            EditMatrixView(row1: $row1, row2: $row2, row3: $row3, row4: $row4, row5: $row5, row6: $row6, row7: $row7)
        }
    }
}

struct GuideEditView_Previews: PreviewProvider {
    static var previews: some View {
        GuideEditView()
    }
}
