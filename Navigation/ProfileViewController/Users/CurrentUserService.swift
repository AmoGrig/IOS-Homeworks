//
//  CurrentUserService.swift
//  Navigation
//
//  Created by ARAM on 31.08.2022.
//

import Foundation
import UIKit

class CurrentUserService: UserService {
    let user: User = User(login: "Aram", fullName: "Aram Grigoryan", avatar: UIImage(named: "MosCity")!, status: "Hi everyone...")
    
    func data(login: String) -> User? {
        guard login == user.login else {
            print("No data")
            return nil
        }
        return user
    }
}
