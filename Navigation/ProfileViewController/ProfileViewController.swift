//
//  ProfileViewController.swift
//  Navigation
//
//  Created by ARAM on 04.06.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(StaticPostsTableViewCell.self, forCellReuseIdentifier: "StaticCell")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
        tableView.backgroundColor = .systemGray4
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        #if DEBUG
        self.view.backgroundColor = .systemBackground
        #else
        self.view.backgroundColor = .systemGray4
        #endif
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    struct Mock {

        static let shared = Mock()

        private init () {}

        let data: [Post1] = [
            Post1(author: "James", description: "About life transfomation", image: "A", likes: "Likes: 150", views: "Views: 1250"),
            Post1(author: "Michael", description: "IT technologies", image: "B", likes: "Likes: 500", views: "Views: 5600"),
            Post1(author: "Smith", description: "Man and Woman relations", image: "C", likes: "Likes: 780", views: "Views: 9976"),
            Post1(author: "Stephen", description: "Life in Dubai", image: "D", likes: "Likes: 650", views: "Views: 4500")
        ]
    }
    
    private let posts: [Post1] = Mock.shared.data
    
    
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
           return posts.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "StaticCell", for: indexPath) as! StaticPostsTableViewCell
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath) as! PhotosTableViewCell
       
        let post = self.posts[indexPath.row]
        cell2.setup(with: post)
        
        if indexPath.section == 0 {
            return cell1
        } else {
            return cell2
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated:true)
        let vc = PhotosCollectionViewController()
        vc.navBarTitle = "Photo Gallery"
        indexPath.section == 0 ? navigationController?.pushViewController(vc, animated: true) : nil
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = ProfileHeaderView()
        
        if section == 0 {
            return view
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 210
        } else {
            return UITableView.automaticDimension
        }
    }
}
