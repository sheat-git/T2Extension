//
//  CardFrontView.swift
//  T2Extension
//
//  Created by 大畑允人 on 2021/12/31.
//

import SwiftUI

struct CardFrontView: View {
    
    @AppStorage("Account", store: UserDefaults.T2E) private var account: String = ""
    @AppStorage("Password", store: UserDefaults.T2E) private var password: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                HStack {
                    Image("AppIconImage")
                        .resizable()
                        .frame(width: geometry.size.width/7.5, height: geometry.size.height/5)
                        .foregroundColor(.accentColor)
                        .background(Color.systemBackground)
                        .cornerRadius(geometry.size.width/30)
                    
                    VStack(alignment: .leading) {
                        Text("T2Extension")
                            .lineLimit(1)
                            .font(.system(size: geometry.size.height/10, weight: .bold, design: .default))
                        Text("for Tokyo Institute of Technology")
                            .lineLimit(1)
                            .font(.system(size: geometry.size.height/20, weight: .regular, design: .serif))
                    }
                    .foregroundColor(.systemBackground)
                    
                    Spacer()
                }
                .padding(geometry.size.width/60)
                .padding(.top, geometry.size.height/40)
                .background(Color.accentColor)
                
                Rectangle()
                    .fill(Color.customSkyblue)
                    .frame(height: geometry.size.height/40)
                
                Rectangle()
                    .fill(Color.accentColor)
                    .frame(height: geometry.size.height/40)
                
                HStack {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: geometry.size.width*11/30, height: geometry.size.height*11/20)
                        .foregroundColor(.accentColor)
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Spacer()
                        Text("Account")
                            .font(.system(size: geometry.size.height/20))
                        Text(account)
                            .font(.system(size: geometry.size.height/10, weight: .bold, design: .monospaced))
                        Spacer()
                        Text("Password")
                            .font(.system(size: geometry.size.height/20))
                        Text(String(repeating: "*", count: password.count))
                            .font(.system(size: geometry.size.height/10, weight: .bold, design: .monospaced))
                        Spacer()
                    }
                    
                    Spacer()
                }
                .padding(10)
                
                Spacer()
            }
            .background(Color.systemBackground)
            .cornerRadius(geometry.size.width/20)
            .compositingGroup()
        }
    }
}

struct CardFrontView_Previews: PreviewProvider {
    static var previews: some View {
        CardFrontView()
            .frame(width: 300, height: 200)
            .shadow(color: .secondary, radius: 20)
    }
}
