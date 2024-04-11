//
//  GuideiPhoneView.swift
//  T2Extension
//
//  Created by 大畑允人 on 2022/01/02.
//

import SwiftUI

struct GuideiPhoneView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()

                ScrollView {
                    VStack {
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text("1. Open")
                                Button("Settings App") {
                                    UIApplication.shared.open(URL(string: "App-Prefs:SAFARI&path=WEB_EXTENSIONS/T2AutoLogin")!)
                                }
                            }
                            Text("2. Move to \"Safari > Extensions > T2AutoLogin\"")
                            Text("3. Turn on \"T2AutoLogin\"")
                            Text("4. Allow \"titech.ac.jp\"")
                            Text("5. Done if it likes below")
                        }
                        .lineLimit(nil)
                        .frame(width: min(geometry.size.width * 0.7, 500), alignment: .leading)

                        Image("GuideiPhone")
                            .resizable()
                            .scaledToFit()
                            .frame(width: min(geometry.size.width * 0.7, 500))
                            .cornerRadius(20)
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.accentColor, lineWidth: 4))
                    }
                    .frame(width: geometry.size.width)
                }

                Spacer()
            }
        }
    }
}

struct GuideiPhoneView_Previews: PreviewProvider {
    static var previews: some View {
        GuideiPhoneView()
    }
}
