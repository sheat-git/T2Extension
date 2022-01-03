//
//  CardBackMatrixRowView.swift
//  T2Extension
//
//  Created by 大畑允人 on 2022/01/01.
//

import SwiftUI

struct CardBackMatrixRowView: View {
    
    @Binding var row: String
    var rowNum: Int
    
    var body: some View {
        GeometryReader {geometry in
            HStack(spacing: 0) {
                ForEach(1..<11) { i in
                    Text((row+" ").prefix(i).suffix(1))
                        .font(.system(size: geometry.size.height - 3, weight: .regular, design: .monospaced))
                        .frame(width: geometry.size.width/10, height: geometry.size.height)
                        .background((rowNum%2 == 0) ? Color.systemBackground : Color.customSkyblue)
                }
            }
        }
    }
}

struct CardBackMatrixRow0View: View {
    
    private let abc: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    
    var body: some View {
        GeometryReader {geometry in
            HStack(spacing: 0) {
                ForEach(0..<10) { i in
                    Text(abc[i])
                        .font(.system(size: geometry.size.height - 3, weight: .black, design: .monospaced))
                        .foregroundColor(Color.systemBackground)
                        .frame(width: geometry.size.width/10, height: geometry.size.height)
                        .background(.primary)
                }
            }
        }
    }
}
