//
//  GuideMacView.swift
//  T2Extension
//
//  Created by 大畑允人 on 2022/01/02.
//

import SwiftUI

struct GuideMacView: View {
    @Binding var guideMode: Bool
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                ScrollView {
                    VStack {
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text("1. Open")
                                Button("Safari App") {
                                    UIApplication.shared.open(URL(fileURLWithPath: "/Applications/Safari.app"))
                                }
                            }
                            Text("2. Move to \"Preferences... > Extensions\"")
                            Text("3. Check \"T2AutoLogin\"")
                            Text("4. Click \"Edit Websites...\" and Allow \"titech.ac.jp\"")
                            Text("5. Done if it likes below")
                        }
                        .lineLimit(nil)
                        .frame(width: geometry.size.width)
                        
                        Image("GuideMac-Extensions_done")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width*0.7)
                    }
                }
                
                Button("\(Image(systemName: "arrowshape.turn.up.backward.circle")) back") {
                    guideMode = false
                }
                .buttonStyle(BorderedCapsuleButtonStyle())
                Spacer()
            }
        }
    }
}
