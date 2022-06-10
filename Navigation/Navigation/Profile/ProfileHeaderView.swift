//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by ARAM on 04.06.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    

    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Aram")
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1).cgColor
        imageView.layer.borderWidth = 3
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Aram Grigoryan"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()

    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Waiting for something..."
        label.textColor = .gray
        label.font = label.font.withSize(14)
        return label
    }()
    
    private lazy var statusButton: UIButton = {
        let statusButton = UIButton()
        statusButton.backgroundColor = .systemBlue
        statusButton.setTitle("Show status", for: .normal)
        statusButton.layer.cornerRadius = 4
        statusButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowOpacity = 0.7
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return statusButton
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.height / 2
    }
    
    @objc func buttonPressed() {
        if let text = statusLabel.text {
            print(text)
        }
    }
    
    private func setupView() {
        self.addSubview(self.avatarImageView)
        self.addSubview(self.verticalStack)
        self.verticalStack.addArrangedSubview(self.titleLabel)
        self.verticalStack.addArrangedSubview(self.statusLabel)
        self.addSubview(statusButton)
        
        NSLayoutConstraint.activate([
            self.avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            self.avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            
            self.verticalStack.topAnchor.constraint(equalTo: self.avatarImageView.topAnchor),
            self.verticalStack.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 20),
            self.verticalStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.verticalStack.bottomAnchor.constraint(equalTo: self.statusButton.topAnchor, constant: -34),
            
            self.statusButton.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 16),
            self.statusButton.leadingAnchor.constraint(equalTo: self.avatarImageView.leadingAnchor),
            self.statusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.statusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}

