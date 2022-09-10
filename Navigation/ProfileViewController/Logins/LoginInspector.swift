//
//  LoginInspector.swift
//  Navigation
//
//  Created by ARAM on 09.09.2022.
//

import Foundation


struct LoginInspector: LoginViewControllerDelegate {
    func check(log: String, pass: String) -> Bool {
        return Checker.shared.check(log: log, pass: pass)
    }
}
