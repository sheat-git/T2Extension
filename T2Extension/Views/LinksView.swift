//
//  LinksView.swift
//  T2Extension
//
//  Created by 大畑允人 on 2022/01/26.
//

import SwiftUI

struct LinksView: View {
    
    @State var showLinks = false
    
    var body: some View {
        GeometryReader { geometry in
            
            let standardHeight = geometry.size.height/17
            
            VStack(alignment: .trailing, spacing: standardHeight) {
                
                Link("Tokyo Tech Portal", destination: URL(string: "https://portal.titech.ac.jp")!)
                    .buttonStyle(LinkButtonStyle(fontStyle: .system(size: standardHeight*2, weight: .medium, design: .default), pH: standardHeight, fH: standardHeight*5))
                    .opacity(showLinks ? 1 : 0)
                    .animation(.default, value: showLinks)
                
                Link("T2SCHOLA", destination: URL(string: "https://t2schola.titech.ac.jp/")!)
                    .buttonStyle(LinkButtonStyle(fontStyle: .system(size: standardHeight*2, weight: .medium, design: .default), pH: standardHeight, fH: standardHeight*5))
                    .opacity(showLinks ? 1 : 0)
                    .animation(.default, value: showLinks)
                
                Button("\(Image(systemName: showLinks ? "xmark.circle.fill" : "safari.fill"))") {
                    showLinks.toggle()
                }
                .buttonStyle(SafariButtonStyle(height: standardHeight*5))
                .animation(.default, value: showLinks)
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .bottomTrailing)
        }
    }
}

struct LinksView_Previews: PreviewProvider {
    static var previews: some View {
        LinksView()
            .frame(height: 180)
            .padding()
    }
}
