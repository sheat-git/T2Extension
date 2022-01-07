//
//  T2ExtensionApp.swift
//  T2Extension
//
//  Created by 大畑允人 on 2021/12/31.
//

import SwiftUI

@main
struct T2ExtensionApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    #if targetEnvironment(macCatalyst)
    override func buildMenu(with builder: UIMenuBuilder) {
        guard builder.system == UIMenuSystem.main else { return }
        builder.remove(menu: .file)
        builder.remove(menu: .edit)
        builder.remove(menu: .format)
        builder.remove(menu: .view)
        builder.remove(menu: .window)
        builder.remove(menu: .help)
    }
    #endif
}
