//
//  ButtonStyle.swift
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
            .background(isEnabled ? Color.accentColor : Color.gray)
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
            .foregroundColor(isEnabled ? .accentColor : .gray)
            .font(.body.bold())
            .overlay(Capsule().stroke(isEnabled ? Color.accentColor : Color.gray, lineWidth: 2))
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
            .foregroundColor(configuration.isPressed ? .gray : .letAccentColor)
            .overlay(Capsule().stroke(configuration.isPressed ? Color.gray : Color.letAccentColor, lineWidth: 2))
    }
}

struct GuideButtonStyle: ButtonStyle {
    var fontStyle: Font?

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(fontStyle)
            .foregroundColor(configuration.isPressed ? Color.gray : Color.letAccentColor)
    }
}

struct LinkButtonStyle: ButtonStyle {
    var standardHeight: CGFloat

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: standardHeight * 2))
            .foregroundColor(.systemBackground)
            .padding(.horizontal, standardHeight)
            .frame(height: standardHeight * 5)
            .background(configuration.isPressed ? Color.gray : Color.letAccentColor)
            .clipShape(Capsule())
    }
}

struct SafariButtonStyle: ButtonStyle {
    var size: CGFloat

    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .center) {
            Circle()
                .fill(Color.systemBackground)
                .frame(width: size * 0.9, height: size * 0.9)
            configuration.label
                .font(.system(size: size))
                .foregroundColor(configuration.isPressed ? .gray : .letAccentColor)
                .frame(height: size)
        }
    }
}

struct FormCenterButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.headline)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}
