//
//  MyTabBar.swift
//  Navigation
//
//  Created by ARAM on 10.09.2022.
//

import Foundation
import UIKit

class MyTabBarController: UITabBarController {

    let loginFactory: MyLoginFactory

    init(loginFactory: MyLoginFactory) {
        self.loginFactory = loginFactory
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    func setupTabBar() {

        let feedViewController = createNavController(vc: FeedViewController(), itemName: "Лента", itemImage: "doc.richtext")
        let logInVC = LogInViewController()
        logInVC.loginDelegate = loginFactory.makeLoginInspector()
        let profileViewController = createNavController(vc: logInVC, itemName: "Профиль", itemImage: "person.circle")
        viewControllers = [feedViewController, profileViewController]
    }

    func createNavController(vc: UIViewController, itemName: String, itemImage: String) -> UINavigationController {

        let item = UITabBarItem(title: itemName, image: UIImage(systemName: itemImage), tag: 0)
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item

        return navController
    }

//    func createTabBarController() -> UITabBarController {
//        let tabBarController = UITabBarController()
//        UITabBar.appearance().backgroundColor = .systemGray5
//        UITabBar.appearance().tintColor = .black
//
//        tabBarController.viewControllers = [createFeedViewController(), createLoginViewController()]
//
//        return tabBarController
//    }
//
//    func createFeedViewController() -> UINavigationController {
//        let feedViewController = FeedViewController()
//        feedViewController.title = "Feed"
//        feedViewController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "house.fill"), tag: 0)
//        
//
//        return UINavigationController(rootViewController: feedViewController)
//    }
//
//    func createLoginViewController() -> UINavigationController {
//        let loginViewController = LogInViewController()
//        loginViewController.title = "Profile"
//        loginViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 1)
//
//        return UINavigationController(rootViewController: loginViewController)
//    }

}
