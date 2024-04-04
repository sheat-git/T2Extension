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

            let standardHeight = geometry.size.height / 17

            ZStack {
                Button("Tokyo Tech Poral") {
                    showLinks = false
                    UIApplication.shared.open(URL(string: "https://portal.titech.ac.jp")!)
                }
                .buttonStyle(LinkButtonStyle(standardHeight: standardHeight))
                .opacity(showLinks ? 1 : 0)
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: showLinks ? .topTrailing : .bottomTrailing)
                .compositingGroup()

                Button("T2SCHOLA") {
                    showLinks = false
                    UIApplication.shared.open(URL(string: "https://t2schola.titech.ac.jp/")!)
                }
                .buttonStyle(LinkButtonStyle(standardHeight: standardHeight))
                .opacity(showLinks ? 1 : 0)
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: showLinks ? .trailing : .bottomTrailing)
                .compositingGroup()

                Button("\(Image(systemName: showLinks ? "xmark.circle.fill" : "safari.fill"))") {
                    showLinks.toggle()
                }
                .buttonStyle(SafariButtonStyle(size: standardHeight * 5))
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .bottomTrailing)
                .compositingGroup()
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .animation(.default, value: showLinks)
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
