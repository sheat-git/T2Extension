//
//  EditView.swift
//  T2Extension
//
//  Created by 大畑允人 on 2021/12/31.
//

import SwiftUI

struct EditView: View {
    
    @State private var guideMode = false
    
    @Binding var editMode: Bool
    
    @Binding var account: String
    @Binding var password: String
    
    @Binding var row1: String
    @Binding var row2: String
    @Binding var row3: String
    @Binding var row4: String
    @Binding var row5: String
    @Binding var row6: String
    @Binding var row7: String
    
    var body: some View {
        VStack {
            Spacer()
            
            Form {
                Section(header: Text("Account")) {
                    TextField("Account", text: $account)
                    SecureField("Password", text: $password)
                }
                .textInputAutocapitalization(.never)
                .keyboardType(.asciiCapable)
                
                EditMatrixView(row1: $row1, row2: $row2, row3: $row3, row4: $row4, row5: $row5, row6: $row6, row7: $row7)
            }
            
            Button("\(Image(systemName: "checkmark.circle")) done") {
                editMode = false
            }
            .buttonStyle(CapsuleButtonStyle())
            
            Spacer()
        }
        .background(Color.systemGroupedBackground)
        .navigate(to: GuideEditView(guideMode: $guideMode), when: $guideMode)
    }
}

struct EditView_Previews: PreviewProvider {
    
    @State static var editMode = true
    
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
        EditView(editMode: $editMode, account: $account, password: $password, row1: $row1, row2: $row2, row3: $row3, row4: $row4, row5: $row5, row6: $row6, row7: $row7)
    }
}
