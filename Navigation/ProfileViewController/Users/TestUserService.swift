//
//  TestUserService.swift
//  Navigation
//
//  Created by ARAM on 04.09.2022.
//

import Foundation
import UIKit


class TestUserService: UserService {
    let user1: User = User(login: "Aram", fullName: "Aram Grigoryan", avatar: UIImage(named: "MosCity")!, status: "Hi everyone...")
    
    func data(login: String) -> User? {
        guard login == user1.login else {
            print("No data")
            return nil
        }
        return user1
    }
}
