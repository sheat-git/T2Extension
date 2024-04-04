//
//  T2ExtensionApp.swift
//  T2Extension
//
//  Created by 大畑允人 on 2021/12/31.
//

import KeychainAccess
import SwiftUI

@main
struct T2ExtensionApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            HomeView()
                .withHostingWindow { window in
                    #if targetEnvironment(macCatalyst)
                        if let titlebar = window?.windowScene?.titlebar {
                            titlebar.titleVisibility = .hidden
                            titlebar.toolbar = nil
                        }
                    #endif
                }
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        let oldSchemaVersion: Int = UserDefaults.T2E.object(forKey: "SchemaVersion") as? Int ?? 1
        if oldSchemaVersion < 2 {
            let appIdentifierPrefix = Bundle.main.infoDictionary!["AppIdentifierPrefix"] as! String
            let keychain = Keychain(service: "tokyo.sheat.T2Extension", accessGroup: appIdentifierPrefix + "T2AccountShareGroup")
            for key in ["Account", "Password"] {
                try? keychain.set(UserDefaults.T2E.string(forKey: key) ?? "", key: key)
                UserDefaults.T2E.removeObject(forKey: key)
            }
            for n in 1 ... 7 {
                let key = "Row\(n)"
                try? keychain.set(UserDefaults.T2E.string(forKey: key) ?? "", key: key)
                UserDefaults.T2E.removeObject(forKey: key)
            }
        }
        if oldSchemaVersion != 2 {
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

// hide title bar for mac
private extension View {
    func withHostingWindow(_ callback: @escaping (UIWindow?) -> Void) -> some View {
        background(HostingWindowFinder(callback: callback))
    }
}

private struct HostingWindowFinder: UIViewRepresentable {
    var callback: (UIWindow?) -> Void

    func makeUIView(context _: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async { [weak view] in
            self.callback(view?.window)
        }
        return view
    }

    func updateUIView(_: UIView, context _: Context) {}
}
