//
//  EditView.swift
//  T2Extension
//
//  Created by 大畑允人 on 2021/12/31.
//

import SwiftUI

struct EditView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var account: String
    @Binding var password: String
    
    @Binding var row1: String
    @Binding var row2: String
    @Binding var row3: String
    @Binding var row4: String
    @Binding var row5: String
    @Binding var row6: String
    @Binding var row7: String
    
    var cardHeight: CGFloat
    var cardWidth: CGFloat
    var padHeight: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                
                HStack {
                    Spacer()
                    
                    Button("\(Image(systemName: "checkmark.circle"))") {
                        dismiss()
                    }
                    .buttonStyle(GuideButtonStyle(fontStyle: .system(size: cardHeight/11, weight: .medium, design: .default)))
                }
                .frame(width: geometry.size.width*0.9)
                .padding(.top, padHeight*2)
                
                Form {
                    Section(header: Text("Account")) {
                        TextField("Account", text: $account)
                        SecureField("Password", text: $password)
                    }
                    .textInputAutocapitalization(.never)
                    .keyboardType(.asciiCapable)
                    
                    EditMatrixView(row1: $row1, row2: $row2, row3: $row3, row4: $row4, row5: $row5, row6: $row6, row7: $row7)
                }
                
                Spacer()
            }
            .background(Color.systemGroupedBackground)
        }
    }
}

struct EditView_Previews: PreviewProvider {
    
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
        GeometryReader { geometry in
            
            let cardHeight = min(geometry.size.width*0.6, geometry.size.height*0.5)
            let cardWidth = min(geometry.size.width*0.9, geometry.size.height*0.75)
            let padHeight = min(geometry.size.width*0.8, geometry.size.height*0.25)/30
            
            EditView(account: $account, password: $password, row1: $row1, row2: $row2, row3: $row3, row4: $row4, row5: $row5, row6: $row6, row7: $row7, cardHeight: cardHeight, cardWidth: cardWidth, padHeight: padHeight)
        }
    }
}
