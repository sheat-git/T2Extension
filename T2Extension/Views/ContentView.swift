//
//  ContentView.swift
//  T2Extension
//
//  Created by 大畑允人 on 2021/12/31.
//

import SwiftUI

struct ContentView: View {
    
    @State private var editMode = false
    @State private var guideMode = false
    
    @Environment(\.horizontalSizeClass) private var hSizeClass
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                Spacer()
                
                if (hSizeClass == .compact) {
                    CardFlippingView()
                        .frame(width: geometry.size.width*0.9, height: geometry.size.width*0.6)
                } else {
                    CardFlippingView()
                        .frame(width: geometry.size.width*0.45, height: geometry.size.width*0.3)
                }
                
                Spacer()
                
                Button("\(Image(systemName: "creditcard.and.123")) edit Account") {
                    editMode = true
                }
                .buttonStyle(BorderedCapsuleButtonStyle())
                
                Button("\(Image(systemName: "figure.walk.circle")) see guide") {
                    guideMode = true
                }
                .buttonStyle(BorderedCapsuleButtonStyle())
                
                Spacer()
                
                Link("\(Image(systemName: "safari")) open Tokyo Tech Portal", destination: URL(string: "https://portal.titech.ac.jp")!)
                    .buttonStyle(BorderedCapsuleButtonStyle())
                
                Link("\(Image(systemName: "safari")) open T2Schola", destination: URL(string: "https://t2schola.titech.ac.jp/")!)
                    .buttonStyle(BorderedCapsuleButtonStyle())
                
                Spacer()
                
            }
            .frame(width: geometry.size.width)
        }
        .navigate(to: EditView(editMode: $editMode), when: $editMode)
        #if targetEnvironment(macCatalyst)
        .navigate(to: GuideMacView(guideMode: $guideMode), when: $guideMode)
        #else
        .navigate(to: GuideiPhoneView(guideMode: $guideMode), when: $guideMode)
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
