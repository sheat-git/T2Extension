//
//  HomeView.swift
//  T2Extension
//
//  Created by 大畑允人 on 2021/12/31.
//

import SwiftUI

struct HomeView: View {
    
    @State private var editMode = false
    @State private var guideMode = false
    
    @SecureAppStorage("Account") private var account = ""
    @SecureAppStorage("Password") private var password = ""
    
    @SecureAppStorage("Row1") private var row1 = ""
    @SecureAppStorage("Row2") private var row2 = ""
    @SecureAppStorage("Row3") private var row3 = ""
    @SecureAppStorage("Row4") private var row4 = ""
    @SecureAppStorage("Row5") private var row5 = ""
    @SecureAppStorage("Row6") private var row6 = ""
    @SecureAppStorage("Row7") private var row7 = ""
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                Spacer()
                
                CardFlippingView(account: $account, password: $password, row1: $row1, row2: $row2, row3: $row3, row4: $row4, row5: $row5, row6: $row6, row7: $row7)
                    .frame(width: min(geometry.size.width*0.9, geometry.size.height*0.75), height: min(geometry.size.width*0.6, geometry.size.height*0.5))
                
                Spacer()
                
                Button("\(Image(systemName: "creditcard.and.123")) edit Account") {
                    editMode = true
                }
                .buttonStyle(BorderedCapsuleButtonStyle())
                
                Button("\(Image(systemName: "questionmark.circle")) see guide") {
                    guideMode = true
                }
                .buttonStyle(BorderedCapsuleButtonStyle())
                
                Spacer()
                
                Link("\(Image(systemName: "safari")) open Tokyo Tech Portal", destination: URL(string: "https://portal.titech.ac.jp")!)
                    .buttonStyle(BorderedCapsuleButtonStyle())
                
                Link("\(Image(systemName: "safari")) open T2SCHOLA", destination: URL(string: "https://t2schola.titech.ac.jp/")!)
                    .buttonStyle(BorderedCapsuleButtonStyle())
                
                Spacer()
                
            }
            .frame(width: geometry.size.width)
        }
        .navigate(to: EditView(editMode: $editMode, account: $account, password: $password, row1: $row1, row2: $row2, row3: $row3, row4: $row4, row5: $row5, row6: $row6, row7: $row7), when: $editMode)
        #if targetEnvironment(macCatalyst)
        .navigate(to: GuideMacView(guideMode: $guideMode), when: $guideMode)
        #else
        .navigate(to: GuideiPhoneView(guideMode: $guideMode), when: $guideMode)
        #endif
    }
}

struct HomewView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
