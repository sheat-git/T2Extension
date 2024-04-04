//
//  SecureAppStorage.swift
//  T2Extension
//
//  Created by 大畑允人 on 2022/01/23.
//

import KeychainAccess
import SwiftUI

@propertyWrapper
struct SecureAppStorage: DynamicProperty {
    let key: String
    @State private var value: String

    let keychain = Keychain(service: "tokyo.sheat.T2Extension", accessGroup: Bundle.main.infoDictionary!["AppIdentifierPrefix"] as! String + "T2AccountShareGroup")

    init(wrappedValue: String = "", _ key: String) {
        self.key = key
        let initialValue = (try? keychain.get(key)) ?? wrappedValue
        _value = State<String>(initialValue: initialValue)
    }

    var wrappedValue: String {
        get { value }

        nonmutating set {
            value = newValue
            do {
                try keychain.set(value, key: key)
            } catch {
                fatalError("\(error)")
            }
        }
    }

    var projectedValue: Binding<String> {
        Binding(get: { wrappedValue }, set: { wrappedValue = $0 })
    }
}
