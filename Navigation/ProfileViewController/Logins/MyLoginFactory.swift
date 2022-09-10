//
//  MyLoginFactory.swift
//  Navigation
//
//  Created by ARAM on 10.09.2022.
//

import Foundation

class MyLoginFactory: LoginFactory {
    func makeLoginInspector() -> LoginInspector {
        
        return LoginInspector()
    }

}
