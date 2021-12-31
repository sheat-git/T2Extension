//
//  EditView.swift
//  T2Extension
//
//  Created by 大畑允人 on 2021/12/31.
//

import SwiftUI

struct EditView: View {
    @AppStorage("Account", store: UserDefaults.T2E) private var account = ""
    @AppStorage("Password", store: UserDefaults.T2E) private var password = ""
    
    var body: some View {
        Form {
            Section(header: Text("Account")) {
                TextField("Account", text: $account)
                SecureField("Password", text: $password)
            }
            EditMatrixView()
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
