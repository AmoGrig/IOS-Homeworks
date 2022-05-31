//
//  FeedViewController.swift
//  Navigation
//
//  Created by ARAM on 29.05.2022.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        postButton()
    }
    
    var post = Post(title: "MyPost")
    
    func postButton() {
        let button = UIButton(frame: CGRect.init(x: 95, y: 200, width: 300, height: 80))
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.center = view.center
        button.setTitle("View Post", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        view.addSubview(button)
        

        button.addTarget(self, action: #selector(postViewClick), for: .touchUpInside)


    }

    
    @objc func postViewClick() {
        let postVC = PostViewController()
        postVC.titlePost = post.title
        self.navigationController?.pushViewController(postVC, animated: true)
        
    }
    

}

