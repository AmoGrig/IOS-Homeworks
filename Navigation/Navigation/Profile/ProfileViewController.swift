//
//  ProfileViewController.swift
//  Navigation
//
//  Created by ARAM on 04.06.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        self.view.addSubview(self.profileHeader)
    }
    
    let profileHeader = ProfileHeaderView()

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.profileHeader.frame = self.view.bounds
    }
        
    
}
