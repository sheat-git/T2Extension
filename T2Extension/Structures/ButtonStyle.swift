//
//  Button.swift
//  T2Extension
//
//  Created by 大畑允人 on 2022/01/02.
//

import Foundation


import SwiftUI

struct CapsuleButtonStyle: ButtonStyle {
        
    @Environment(\.isEnabled) var isEnabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(self.isEnabled ? Color.accentColor : Color.gray)
            .foregroundColor(.white)
            .font(.body.bold())
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

struct BorderedCapsuleButtonStyle: ButtonStyle {
        
    @Environment(\.isEnabled) var isEnabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(self.isEnabled ? Color.accentColor : Color.gray)
            .font(.body.bold())
            .overlay(Capsule().stroke(self.isEnabled ? Color.accentColor : Color.gray, lineWidth: 2))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

struct FormCenterButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.headline)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}
