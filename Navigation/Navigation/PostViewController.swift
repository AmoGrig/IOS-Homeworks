//
//  PostViewController.swift
//  Navigation
//
//  Created by ARAM on 30.05.2022.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = titlePost
        self.view.backgroundColor = .lightGray

    }
    
    var titlePost: String = "NoPostTitle"

}
