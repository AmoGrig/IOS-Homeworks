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
        tableView.backgroundColor = .systemGray4
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StaticCell", for: indexPath) as? StaticPostsTableViewCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            return cell
        }
        
        let post = self.posts[indexPath.row]
        cell.setup(with: post)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        250
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = ProfileHeaderView()

        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        210
    }
}
