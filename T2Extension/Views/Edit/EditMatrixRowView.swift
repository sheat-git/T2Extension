//
//  EditMatrixRowView.swift
//  T2Extension
//
//  Created by 大畑允人 on 2021/12/31.
//

import SwiftUI

struct EditMatrixRowView: View {
    @Binding var row: String
    var num: Int
    
    var body: some View {
        ZStack(alignment: .trailing) {
            TextField("Row \(num)", text: $row)
                .font(.system(.body, design: .monospaced))
            Text("\(row.count)/10")
                .font(.footnote)
                .foregroundColor((row.count == 10) ? .primary : .red)
        }
    }
}
