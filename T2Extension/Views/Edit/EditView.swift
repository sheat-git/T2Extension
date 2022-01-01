//
//  EditView.swift
//  T2Extension
//
//  Created by 大畑允人 on 2021/12/31.
//

import SwiftUI

struct EditView: View {
    
    @Binding var editMode: Bool
    
    @AppStorage("Account", store: UserDefaults.T2E) private var account = ""
    @AppStorage("Password", store: UserDefaults.T2E) private var password = ""
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Account")) {
                    TextField("Account", text: $account)
                    SecureField("Password", text: $password)
                }
                .textInputAutocapitalization(.never)
                .keyboardType(.asciiCapable)
                
                EditMatrixView()
            }
            Button("\(Image(systemName: "checkmark.circle")) done") {
                editMode = false
            }
            .buttonStyle(BorderedCapsuleButtonStyle())
            
            Spacer()
        }
        .background(Color.systemGroupedBackground)
    }
}
