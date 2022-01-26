//
//  CardBackView.swift
//  T2Extension
//
//  Created by 大畑允人 on 2021/12/31.
//

import SwiftUI

struct CardBackView: View {
    
    @Binding var row1: String
    @Binding var row2: String
    @Binding var row3: String
    @Binding var row4: String
    @Binding var row5: String
    @Binding var row6: String
    @Binding var row7: String
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                Spacer()
                
                HStack(alignment: .bottom) {
                    Spacer()
                    Image("IcTip")
                        .resizable()
                        .frame(width: geometry.size.width/5, height: geometry.size.height/4)
                        .foregroundColor(.letAccentColor)
                    
                    Spacer()
                    
                    CardBackMatrixView(row1: $row1, row2: $row2, row3: $row3, row4: $row4, row5: $row5, row6: $row6, row7: $row7)
                    
                    Spacer()
                }
                .frame(width: geometry.size.width, height: geometry.size.height*0.65)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("NOTION")
                    Text("Your account information and matrix code will be stored locally and will not be made public.")
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.leading, geometry.size.width/40)
                    Text("You do so at your own risk.")
                        .padding(.leading, geometry.size.width/40)
                }
                .font(.system(size: geometry.size.height/28))
                
                Spacer()
            }
            .background(Color.systemBackground)
            .cornerRadius(geometry.size.width/20)
            .compositingGroup()
        }
    }
}

struct _CardBackView: View {
    @AppStorage("Row1", store: UserDefaults.T2E) private var row1 = ""
    @AppStorage("Row2", store: UserDefaults.T2E) private var row2 = ""
    @AppStorage("Row3", store: UserDefaults.T2E) private var row3 = ""
    @AppStorage("Row4", store: UserDefaults.T2E) private var row4 = ""
    @AppStorage("Row5", store: UserDefaults.T2E) private var row5 = ""
    @AppStorage("Row6", store: UserDefaults.T2E) private var row6 = ""
    @AppStorage("Row7", store: UserDefaults.T2E) private var row7 = ""
    var body: some View {
        CardBackView(row1: $row1, row2: $row2, row3: $row3, row4: $row4, row5: $row5, row6: $row6, row7: $row7)
    }
}

struct CardBackView_Previews: PreviewProvider {
    
    @State static var row1: String = String.randomUppercase(length: 10)
    @State static var row2: String = String.randomUppercase(length: 10)
    @State static var row3: String = String.randomUppercase(length: 10)
    @State static var row4: String = String.randomUppercase(length: 10)
    @State static var row5: String = String.randomUppercase(length: 10)
    @State static var row6: String = String.randomUppercase(length: 10)
    @State static var row7: String = String.randomUppercase(length: 7)
    
    static var previews: some View {
        CardBackView(row1: $row1, row2: $row2, row3: $row3, row4: $row4, row5: $row5, row6: $row6, row7: $row7)
            .frame(width: 300, height: 200)
            .shadow(color: .secondary, radius: 20)
    }
}
