//
//  CardBackMatrixView.swift
//  T2Extension
//
//  Created by 大畑允人 on 2021/12/31.
//

import SwiftUI

struct CardBackMatrixView: View {
    
    @AppStorage("Row1", store: UserDefaults.T2E) private var row1 = ""
    @AppStorage("Row2", store: UserDefaults.T2E) private var row2 = ""
    @AppStorage("Row3", store: UserDefaults.T2E) private var row3 = ""
    @AppStorage("Row4", store: UserDefaults.T2E) private var row4 = ""
    @AppStorage("Row5", store: UserDefaults.T2E) private var row5 = ""
    @AppStorage("Row6", store: UserDefaults.T2E) private var row6 = ""
    @AppStorage("Row7", store: UserDefaults.T2E) private var row7 = ""
    
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .bottom, spacing: 0) {
                VStack(spacing: 0) {
                    ForEach(1..<8) { i in
                        Text("\(i)")
                            .font(.system(size: geometry.size.height/8-3, weight: .black, design: .monospaced))
                            .foregroundColor(Color.systemBackground)
                            .frame(width: geometry.size.width/11, height: geometry.size.height/8)
                            .background((i%2 == 1) ? .primary : .secondary)
                    }
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    CardBackMatrixRow0View()
                        .frame(width: geometry.size.width - geometry.size.width/11, height: geometry.size.height - geometry.size.height/8*7)
                    CardBackMatrixRowView(row: $row1, rowNum: 1)
                        .frame(width: geometry.size.width - geometry.size.width/11, height: geometry.size.height/8)
                    CardBackMatrixRowView(row: $row2, rowNum: 2)
                        .frame(width: geometry.size.width - geometry.size.width/11, height: geometry.size.height/8)
                    CardBackMatrixRowView(row: $row3, rowNum: 3)
                        .frame(width: geometry.size.width - geometry.size.width/11, height: geometry.size.height/8)
                    CardBackMatrixRowView(row: $row4, rowNum: 4)
                        .frame(width: geometry.size.width - geometry.size.width/11, height: geometry.size.height/8)
                    CardBackMatrixRowView(row: $row5, rowNum: 5)
                        .frame(width: geometry.size.width - geometry.size.width/11, height: geometry.size.height/8)
                    CardBackMatrixRowView(row: $row6, rowNum: 6)
                        .frame(width: geometry.size.width - geometry.size.width/11, height: geometry.size.height/8)
                    CardBackMatrixRowView(row: $row7, rowNum: 7)
                        .frame(width: geometry.size.width - geometry.size.width/11, height: geometry.size.height/8)
                }
            }
            .compositingGroup()
        }
    }
}

struct CardBackMatrixView_Previews: PreviewProvider {
    static var previews: some View {
        CardBackMatrixView()
            .frame(width: 230, height: 160)
    }
}
