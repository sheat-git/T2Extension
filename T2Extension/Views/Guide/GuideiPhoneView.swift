//
//  GuideiPhoneView.swift
//  T2Extension
//
//  Created by 大畑允人 on 2022/01/02.
//

import SwiftUI

struct GuideiPhoneView: View {
    
    @Binding var guideMode: Bool
    @State private var subGuideMode = false
    
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
                                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                                }
                            }
                            Text("2. Move to \"Safari > Extensions > T2AutoLogin\"")
                            Text("3. Turn on \"T2AutoLogin\"")
                            Text("4. Allow \"titech.ac.jp\"")
                            Text("5. Done if it likes below")
                        }
                        .lineLimit(nil)
                        .frame(width: min(geometry.size.width*0.7, 500), alignment: .leading)
                        
                        Image("GuideiPhone")
                            .resizable()
                            .scaledToFit()
                            .frame(width: min(geometry.size.width*0.7, 500))
                            .cornerRadius(20)
                    }
                    .frame(width: geometry.size.width)
                }
                
                Button("\(Image(systemName: "questionmark.circle")) how to fill Matrix Code") {
                    subGuideMode = true
                }
                .buttonStyle(BorderedCapsuleButtonStyle())
                
                Button("\(Image(systemName: "arrowshape.turn.up.backward.circle")) back") {
                    guideMode = false
                }
                .buttonStyle(CapsuleButtonStyle())
                
                Spacer()
            }
        }
        .navigate(to: GuideEditView(guideMode: $subGuideMode), when: $subGuideMode)
    }
}

struct GuideiPhoneView_Previews: PreviewProvider {
    
    @State static var guideMode = true
    
    static var previews: some View {
        GuideiPhoneView(guideMode: $guideMode)
    }
    
}
