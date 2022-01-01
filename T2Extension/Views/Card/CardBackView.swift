//
//  CardBackView.swift
//  T2Extension
//
//  Created by 大畑允人 on 2021/12/31.
//

import SwiftUI

struct CardBackView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                Spacer()
                
                HStack(alignment: .bottom) {
                    Spacer()
                    Image("IcTip")
                        .resizable()
                        .frame(width: geometry.size.width/5, height: geometry.size.height/4)
                        .foregroundColor(.accentColor)
                    
                    Spacer()
                    
                    CardBackMatrixView()
                    
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
                .font(.system(size: 7))
                
                Spacer()
            }
            .background(Color.systemBackground)
            .cornerRadius(geometry.size.width/20)
            .compositingGroup()
        }
    }
}

struct CardBackView_Previews: PreviewProvider {
    static var previews: some View {
        CardBackView()
            .frame(width: 300, height: 200)
            .shadow(color: .secondary, radius: 20)
    }
}
