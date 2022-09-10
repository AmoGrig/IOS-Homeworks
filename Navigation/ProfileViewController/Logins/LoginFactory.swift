//
//  LoginFactory.swift
//  Navigation
//
//  Created by ARAM on 10.09.2022.
//

import Foundation

protocol LoginFactory {
    func makeLoginInspector() -> LoginInspector
}
