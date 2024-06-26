//
//  CardBackMatrixView.swift
//  T2Extension
//
//  Created by 大畑允人 on 2021/12/31.
//

import SwiftUI

struct CardBackMatrixView: View {
    @Binding var row1: String
    @Binding var row2: String
    @Binding var row3: String
    @Binding var row4: String
    @Binding var row5: String
    @Binding var row6: String
    @Binding var row7: String

    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .bottom, spacing: 0) {
                VStack(spacing: 0) {
                    ForEach(1 ..< 8) { i in
                        Text("\(i)")
                            .font(.system(size: geometry.size.height / 8 - 3, weight: .black, design: .monospaced))
                            .foregroundColor(Color.systemBackground)
                            .frame(width: geometry.size.width / 11, height: geometry.size.height / 8)
                            .background((i % 2 == 1) ? .primary : .secondary)
                    }
                }

                VStack(alignment: .leading, spacing: 0) {
                    CardBackMatrixRow0View()
                        .frame(width: geometry.size.width - geometry.size.width / 11, height: geometry.size.height - geometry.size.height / 8 * 7)
                    CardBackMatrixRowView(row: $row1, rowNum: 1)
                        .frame(width: geometry.size.width - geometry.size.width / 11, height: geometry.size.height / 8)
                    CardBackMatrixRowView(row: $row2, rowNum: 2)
                        .frame(width: geometry.size.width - geometry.size.width / 11, height: geometry.size.height / 8)
                    CardBackMatrixRowView(row: $row3, rowNum: 3)
                        .frame(width: geometry.size.width - geometry.size.width / 11, height: geometry.size.height / 8)
                    CardBackMatrixRowView(row: $row4, rowNum: 4)
                        .frame(width: geometry.size.width - geometry.size.width / 11, height: geometry.size.height / 8)
                    CardBackMatrixRowView(row: $row5, rowNum: 5)
                        .frame(width: geometry.size.width - geometry.size.width / 11, height: geometry.size.height / 8)
                    CardBackMatrixRowView(row: $row6, rowNum: 6)
                        .frame(width: geometry.size.width - geometry.size.width / 11, height: geometry.size.height / 8)
                    CardBackMatrixRowView(row: $row7, rowNum: 7)
                        .frame(width: geometry.size.width - geometry.size.width / 11, height: geometry.size.height / 8)
                }
            }
            .compositingGroup()
        }
    }
}

struct CardBackMatrixView_Previews: PreviewProvider {
    @State static var row1: String = .randomUppercase(length: 10)
    @State static var row2: String = .randomUppercase(length: 10)
    @State static var row3: String = .randomUppercase(length: 10)
    @State static var row4: String = .randomUppercase(length: 10)
    @State static var row5: String = .randomUppercase(length: 10)
    @State static var row6: String = .randomUppercase(length: 10)
    @State static var row7: String = .randomUppercase(length: 10)

    static var previews: some View {
        CardBackMatrixView(row1: $row1, row2: $row2, row3: $row3, row4: $row4, row5: $row5, row6: $row6, row7: $row7)
            .frame(width: 230, height: 160)
    }
}
