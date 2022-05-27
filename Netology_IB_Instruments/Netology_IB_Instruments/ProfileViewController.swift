//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by ARAM on 24.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let myMaket = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? ProfileView {
            myMaket.frame = CGRect(x: 10, y: 10, width: 375, height: 550)
            view.addSubview(myMaket)
        }
    }
    
}
