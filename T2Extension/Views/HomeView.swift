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
            
            let cardHeight = min(geometry.size.width*0.6, geometry.size.height*0.5)
            let cardWidth = min(geometry.size.width*0.9, geometry.size.height*0.75)
            let padHeight = min(geometry.size.width*0.8, geometry.size.height*0.25)/30
            
            VStack {
                
                HStack {
                    Spacer()
                    
                    Button("\(Image(systemName: "questionmark.circle"))") {
                        guideMode = true
                    }
                    .buttonStyle(GuideButtonStyle(fontStyle: .system(size: cardHeight/11, weight: .medium, design: .default)))
                }
                .frame(width: cardWidth)
                .padding(.vertical, padHeight)
                
                CardFlippingView(account: $account, password: $password, row1: $row1, row2: $row2, row3: $row3, row4: $row4, row5: $row5, row6: $row6, row7: $row7)
                    .frame(width: cardWidth, height: cardHeight)
                
                Button("\(Image(systemName: "pencil")) edit") {
                    editMode = true
                }
                .buttonStyle(EditButtonStyle(fontStyle: .system(size: cardHeight/15, weight: .bold, design: .default), pH: cardHeight/30, pV: cardHeight/100))
                .padding(.top, 16)
                
                Spacer()
                
                LinksView()
                    .frame(width: cardWidth, height: padHeight*30)
                
                Spacer()
                    .frame(maxHeight: padHeight*2)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .sheet(isPresented: $guideMode) {
                GuideView(cardHeight: cardHeight, cardWidth: cardWidth, padHeight: padHeight)
            }
            .sheet(isPresented: $editMode) {
                EditView(account: $account, password: $password, row1: $row1, row2: $row2, row3: $row3, row4: $row4, row5: $row5, row6: $row6, row7: $row7, cardHeight: cardHeight, cardWidth: cardWidth, padHeight: padHeight)
            }
        }
    }
}

struct HomewView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
