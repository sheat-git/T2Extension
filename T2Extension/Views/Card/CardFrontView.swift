//
//  CardFrontView.swift
//  T2Extension
//
//  Created by 大畑允人 on 2021/12/31.
//

import SwiftUI

struct CardFrontView: View {
    @Binding var account: String
    @Binding var password: String

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                HStack {
                    Image("AppIconImage")
                        .resizable()
                        .frame(width: geometry.size.width / 7.5, height: geometry.size.height / 5)
                        .foregroundColor(.letAccentColor)
                        .background(Color.secondarySystemGroupedBackground)
                        .cornerRadius(geometry.size.width / 30)

                    VStack(alignment: .leading) {
                        Text("T2Extension")
                            .lineLimit(1)
                            .font(.system(size: geometry.size.height / 10, weight: .bold, design: .default))
                        Text("for Tokyo Institute of Technology")
                            .lineLimit(1)
                            .font(.system(size: geometry.size.height / 20, weight: .regular, design: .serif))
                    }
                    .foregroundColor(.secondarySystemGroupedBackground)

                    Spacer()
                }
                .padding(geometry.size.width / 60)
                .padding(.top, geometry.size.height / 40)
                .background(Color.letAccentColor)

                Rectangle()
                    .fill(Color.customSkyblue)
                    .frame(height: geometry.size.height / 40)

                Rectangle()
                    .fill(Color.letAccentColor)
                    .frame(height: geometry.size.height / 40)

                HStack {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: geometry.size.width * 11 / 30, height: geometry.size.height * 11 / 20)
                        .foregroundColor(.letAccentColor)

                    Spacer()

                    VStack(alignment: .leading) {
                        Spacer()
                        Text("Account")
                            .font(.system(size: geometry.size.height / 20))
                        Text(account)
                            .font(.system(size: geometry.size.height / 10, weight: .bold, design: .monospaced))
                        Spacer()
                        Text("Password")
                            .font(.system(size: geometry.size.height / 20))
                        Text(String(repeating: "*", count: password.count))
                            .font(.system(size: geometry.size.height / 10, weight: .bold, design: .monospaced))
                        Spacer()
                    }

                    Spacer()
                }
                .padding(10)

                Spacer()
            }
            .background(Color.secondarySystemGroupedBackground)
            .cornerRadius(geometry.size.width / 20)
            .compositingGroup()
        }
    }
}

struct _CardFrontView: View {
    @AppStorage("Account") private var account = ""
    @AppStorage("Password") private var password = ""
    var body: some View {
        CardFrontView(account: $account, password: $password)
    }
}

struct CardFrontView_Previews: PreviewProvider {
    @State static var account = "20B00000"
    @State static var password = "abcd1234"

    static var previews: some View {
        CardFrontView(account: $account, password: $password)
            .frame(width: 300, height: 200)
            .shadow(color: .secondary, radius: 20)
    }
}
