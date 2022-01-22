//
//  T2ExtensionApp.swift
//  T2Extension
//
//  Created by 大畑允人 on 2021/12/31.
//

import SwiftUI
import KeychainAccess

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
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        let oldSchemaVersion: Int = UserDefaults.T2E.object(forKey: "SchemaVersion") as? Int ?? 1
        if (oldSchemaVersion < 2) {
            let appIdentifierPrefix = Bundle.main.infoDictionary!["AppIdentifierPrefix"] as! String
            let keychain = Keychain(service: "tokyo.sheat.T2Extension", accessGroup: appIdentifierPrefix + "T2AccountShareGroup")
            for key in ["Account", "Password"] {
                try? keychain.set(UserDefaults.T2E.string(forKey: key) ?? "", key: key)
                UserDefaults.T2E.removeObject(forKey: key)
            }
            for n in (1...7) {
                let key = "Row\(n)"
                try? keychain.set(UserDefaults.T2E.string(forKey: key) ?? "", key: key)
                UserDefaults.T2E.removeObject(forKey: key)
            }
        }
        if (oldSchemaVersion != 2) {
            UserDefaults.T2E.set(2, forKey: "SchemaVersion")
        }
        return true
    }
    
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
