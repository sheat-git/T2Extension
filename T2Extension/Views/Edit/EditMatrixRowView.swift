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
                .textInputAutocapitalization(.never)
                .keyboardType(.asciiCapable)
            Text("\(row.count)/10")
                .font(.footnote)
                .foregroundColor((row.count == 10) ? .primary : .red)
        }
    }
}

struct EditMatrixRowView_Previews: PreviewProvider {
    
    @State static var row = String.randomUppercase(length: 9)
    
    static var previews: some View {
        EditMatrixRowView(row: $row, num: 1)
    }
    
}
