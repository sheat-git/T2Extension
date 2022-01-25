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
            .foregroundColor(.systemBackground)
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
            .foregroundColor(self.isEnabled ? .accentColor : .gray)
            .font(.body.bold())
            .overlay(Capsule().stroke(self.isEnabled ? Color.accentColor : Color.gray, lineWidth: 2))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

struct EditButtonStyle: ButtonStyle {
    
    var fontStyle: Font?
    var pH: CGFloat
    var pV: CGFloat

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(fontStyle)
            .padding(.horizontal, pH)
            .padding(.vertical, pV)
            .foregroundColor(configuration.isPressed ? .gray : .accentColor)
            .overlay(Capsule().stroke(configuration.isPressed ? Color.gray : Color.accentColor, lineWidth: 2))
    }
}

struct GuideButtonStyle: ButtonStyle {
    
    var fontStyle: Font?
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(fontStyle)
            .foregroundColor(configuration.isPressed ? Color.gray : Color.accentColor)
    }
}

struct LinkButtonStyle: ButtonStyle {
    
    var fontStyle: Font?
    var pH: CGFloat
    var fH: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(fontStyle)
            .foregroundColor(.systemBackground)
            .padding(.horizontal, pH)
            .frame(height: fH)
            .background(configuration.isPressed ? Color.gray : Color.accentColor)
            .clipShape(Capsule())
    }
}

struct SafariButtonStyle: ButtonStyle {
    
    var height: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: height, weight: .medium, design: .default))
            .foregroundColor(configuration.isPressed ? .gray : .accentColor)
            .frame(height: height)
    }
}

struct FormCenterButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.headline)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}
