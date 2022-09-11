//
//  File.swift
//  Navigation
//
//  Created by ARAM on 05.09.2022.
//

import Foundation

class Checker {
    static let shared = Checker()
    
    private let login = "Aram"
    private let password = "234"
    
    func check(log: String, pass: String) -> Bool {
        if log == login && pass == password {
            return true
        } else {
            return false
        }
    }
}

protocol LoginViewControllerDelegate {
    func check(log: String, pass: String) -> Bool
}
