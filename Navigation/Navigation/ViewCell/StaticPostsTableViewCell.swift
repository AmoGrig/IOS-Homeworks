//
//  StaticPostsTableViewCell.swift
//  Navigation
//
//  Created by ARAM on 17.06.2022.
//

import UIKit

class StaticPostsTableViewCell: UITableViewCell {

    private lazy var postView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        return view
    }()
    
    private lazy var postImage: UIImageView = {

        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black

        return imageView
    }()

    private lazy var authorName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    private lazy var likes: UILabel = {

        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        constraints()
        contentView.backgroundColor = .systemGray6
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func setup(with post: Post1) {
            self.authorName.text = post.author
            self.descriptionLabel.text = post.description
            self.postImage.image = UIImage(named: post.image)
            self.likes.text = post.likes
            self.viewsLabel.text = post.views
        }
    

    private func constraints() {

        [postView, authorName, postImage, descriptionLabel, likes, viewsLabel].forEach { contentView.addSubview($0) }

        NSLayoutConstraint.activate([

            postView.topAnchor.constraint(equalTo: contentView.topAnchor),
            postView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

            authorName.topAnchor.constraint(equalTo: postView.topAnchor),
            authorName.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 16),
            authorName.trailingAnchor.constraint(equalTo: postView.trailingAnchor),
            authorName.heightAnchor.constraint(equalToConstant: 50),

            postImage.topAnchor.constraint(equalTo: authorName.bottomAnchor, constant: 16),
            postImage.leadingAnchor.constraint(equalTo: postView.leadingAnchor),
            postImage.trailingAnchor.constraint(equalTo: postView.trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -16),

            likes.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likes.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 16),
            likes.trailingAnchor.constraint(equalTo: postView.trailingAnchor),
            likes.heightAnchor.constraint(equalToConstant: 50),

            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -16),
            viewsLabel.heightAnchor.constraint(equalToConstant: 50),
            viewsLabel.bottomAnchor.constraint(equalTo: postView.bottomAnchor)
        ])
    }
}
