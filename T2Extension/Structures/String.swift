//
//  String.swift
//  T2Extension
//
//  Created by 大畑允人 on 2022/01/02.
//

import Foundation

extension String {
    static func randomUppercase(length: Int) -> String {
        let uppercaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        return String((0..<length).map{ _ in uppercaseLetters.randomElement()!})
    }
}
