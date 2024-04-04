//
//  UserDefaults.swift
//  T2Extension
//
//  Created by 大畑允人 on 2021/12/31.
//

import Foundation

extension UserDefaults {
    static var T2E: Self {
        return Self(suiteName: "group.tokyo.sheat.T2Extension")!
    }
}
