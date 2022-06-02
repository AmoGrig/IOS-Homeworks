//
//  InfoViewController.swift
//  Navigation
//
//  Created by ARAM on 01.06.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Info"
        buttonInfo()
    }
    
    func buttonInfo() {
        let infoButton = UIButton(frame: CGRect.init(x: 50, y: 200, width: 300, height: 80))
        infoButton.backgroundColor = .systemOrange
        infoButton.setTitle("View Alert", for: .normal)
        infoButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        infoButton.layer.cornerRadius = 25
        
        view.addSubview(infoButton)
        
        infoButton.addTarget(self, action: #selector(buttonClick) , for: .touchUpInside)
    }
    
    @objc func buttonClick() {
        let alert = UIAlertController(title: "This is alert", message: "Choose one option", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "ViewMessage", style: .default) { (action: UIAlertAction) in
            print("Hello, world!")
        }
        
        let action2 = UIAlertAction(title: "Cancel", style: .cancel) { (action: UIAlertAction) in
            print("Cancelled")
        }
        
        alert.addAction(action1)
        alert.addAction(action2)
        
        present(alert, animated: true)
    }

}
