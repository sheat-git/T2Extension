//
//  EditMatrixView.swift
//  T2Extension
//
//  Created by 大畑允人 on 2021/12/31.
//

import SwiftUI

struct EditMatrixView: View {
    
    @Binding var row1: String
    @Binding var row2: String
    @Binding var row3: String
    @Binding var row4: String
    @Binding var row5: String
    @Binding var row6: String
    @Binding var row7: String
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    
    var body: some View {
        Section(header: Text("Matrix Code")) {
            EditMatrixRowView(row: $row1, num: 1)
            EditMatrixRowView(row: $row2, num: 2)
            EditMatrixRowView(row: $row3, num: 3)
            EditMatrixRowView(row: $row4, num: 4)
            EditMatrixRowView(row: $row5, num: 5)
            EditMatrixRowView(row: $row6, num: 6)
            EditMatrixRowView(row: $row7, num: 7)
            Button("Import") {
                self.matrixImport()
                showAlert = true
            }
            Button("Export") {
                self.matrixExport()
                showAlert = true
            }
        }
        .alert(alertTitle, isPresented: $showAlert) {
            Button("Close"){}
        } message: {
            Text(alertMessage)
        }
    }
    
    private func matrixImport() {
        alertTitle = "Error!"
        alertMessage = "Incorrect format"
        if !UIPasteboard.general.hasStrings {
            return
        }
        let rawStr: String? = UIPasteboard.general.string
        let matrixJson: String = rawStr ?? ""
        let matrixData = matrixJson.data(using: String.Encoding.utf8)!
        let _matrix: [String]? = try? JSONSerialization.jsonObject(with: matrixData) as? [String]
        if (_matrix == nil) {
            return
        }
        let matrix = _matrix!
        if (matrix.count != 70) {
            return
        }
        row1 = ""
        row2 = ""
        row3 = ""
        row4 = ""
        row5 = ""
        row6 = ""
        row7 = ""
        for i in 0..<10 {
            row1 += matrix[i*7+0]
            row2 += matrix[i*7+1]
            row3 += matrix[i*7+2]
            row4 += matrix[i*7+3]
            row5 += matrix[i*7+4]
            row6 += matrix[i*7+5]
            row7 += matrix[i*7+6]
        }
        alertTitle = "Success!"
        alertMessage = "Fill Matrix Code"
    }
    
    private func matrixExport() {
        alertTitle = "Error!"
        alertMessage = "Incorrect Matrix Code format"
        if (row1.count != 10 || row2.count != 10 || row3.count != 10 || row4.count != 10 || row5.count != 10 || row6.count != 10 || row7.count != 10) {
            return
        }
        let all: String = row1 + row2 + row3 + row4 + row5 + row6 + row7
        let arrayT: [String] = all.map { String($0) }
        var array = [String](repeating: "A", count: 70)
        for i in 0..<10 {
            for j in 0..<7 {
                array[i*7+j] = arrayT[i+j*10]
            }
        }
        let jsonData = try! JSONSerialization.data(withJSONObject: array)
        let jsonStr = String(bytes: jsonData, encoding: .utf8)!
        UIPasteboard.general.string = jsonStr
        alertTitle = "Success!"
        alertMessage = "Copy Matrix Code"
    }
}

struct EditMatrixView_Previews: PreviewProvider {
    
    @State static var row1: String = String.randomUppercase(length: 10)
    @State static var row2: String = String.randomUppercase(length: 10)
    @State static var row3: String = String.randomUppercase(length: 10)
    @State static var row4: String = String.randomUppercase(length: 10)
    @State static var row5: String = String.randomUppercase(length: 10)
    @State static var row6: String = String.randomUppercase(length: 10)
    @State static var row7: String = String.randomUppercase(length: 10)
    
    static var previews: some View {
        Form {
            EditMatrixView(row1: $row1, row2: $row2, row3: $row3, row4: $row4, row5: $row5, row6: $row6, row7: $row7)
        }
    }
}
