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
        
        var myBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openInfoViewController))
        navigationItem.rightBarButtonItem = myBarButton

    }
    
    @objc func openInfoViewController() {
        let infoVC = InfoViewController()
        infoVC.title = "Info"
        present(infoVC, animated: true)
    }
    
    var titlePost: String = "NoPostTitle"

}
