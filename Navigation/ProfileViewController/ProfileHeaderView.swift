//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by ARAM on 04.06.2022.
//

import UIKit
import SnapKit

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
    
    private lazy var cancelButton: UIButton = {
        var button = UIButton(type: .roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "clear.fill"), for: .normal)
        button.alpha = 0
        button.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        return button
    }()
    
    private var imageTopConstraint: NSLayoutConstraint?
    private var imageLeadingConstraint: NSLayoutConstraint?
    private var imageHeightConstraint: NSLayoutConstraint?
    private var imageWidthConstraint: NSLayoutConstraint?
    
    private let tapGestureRecognizer = UITapGestureRecognizer()
    private var isExpanded = false
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        self.setupView()
        self.setupGestures()
        self.setupConstraint()
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
    
    @objc func tapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard self.tapGestureRecognizer === gestureRecognizer else { return }
        
        self.isExpanded.toggle()
        
        self.imageTopConstraint?.constant = self.isExpanded ? center.x : 16
        self.imageWidthConstraint?.constant = self.isExpanded ? frame.width : 120
        self.imageHeightConstraint?.constant = self.isExpanded ? frame.width : 120
        self.avatarImageView.layer.cornerRadius = self.isExpanded ? 0 : 50
        
        UIView.animate(withDuration: 0.5) {
            self.layoutIfNeeded() }
    completion: { _ in

    }
        UIView.animate(withDuration: 0.3, delay: 0.5) {
            self.cancelButton.alpha = self.isExpanded ? 0.5 : 0
        }
    }
    
    @objc private func cancel(_ sender: Any) {
        tapGesture(tapGestureRecognizer)

    }
    
    private func setupGestures() {
        self.avatarImageView.addGestureRecognizer(self.tapGestureRecognizer)
        self.tapGestureRecognizer.addTarget(self, action: #selector(self.tapGesture))
        self.tapGestureRecognizer.view?.isUserInteractionEnabled = true
    }
    
    private func setupView() {
        [avatarImageView, verticalStack, statusButton, cancelButton].forEach {addSubview($0)}
        [titleLabel, statusLabel].forEach {verticalStack.addArrangedSubview($0)}
        
        avatarImageView.snp.makeConstraints { imageView in
            imageView.top.equalToSuperview().inset(16)
            imageView.left.equalToSuperview().inset(16)
            imageView.width.equalTo(100)
            imageView.height.equalTo(100)
        }
        
        verticalStack.snp.makeConstraints {stack in
            stack.top.equalTo(avatarImageView.snp.top)
            stack.left.equalTo(avatarImageView.snp.right).inset(-20)
            stack.right.equalToSuperview().inset(-20)
            stack.bottom.equalTo(statusButton.snp.top).inset(-34)
        }
        
        statusButton.snp.makeConstraints { button in
            button.top.equalTo(avatarImageView.snp.bottom).inset(-16)
            button.left.equalTo(avatarImageView.snp.left)
            button.right.equalTo(snp.right).inset(16)
            button.height.equalTo(50)
        }
        
        cancelButton.snp.makeConstraints {canel in
            canel.top.equalTo(safeAreaLayoutGuide.snp.top)
            canel.right.equalTo(snp.right).inset(16)
            canel.height.equalTo(50)
            canel.width.equalTo(50)
        }
        
//        NSLayoutConstraint.activate([
//
//            self.cancelButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
//            self.cancelButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
//            self.cancelButton.heightAnchor.constraint(equalToConstant: 50),
//            self.cancelButton.widthAnchor.constraint(equalToConstant: 50)
//        ])
    }
    
    private func setupConstraint() {
        self.imageTopConstraint = self.avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        self.imageLeadingConstraint = self.avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        self.imageHeightConstraint = self.avatarImageView.heightAnchor.constraint(equalToConstant: 120)
        self.imageWidthConstraint = self.avatarImageView.widthAnchor.constraint(equalToConstant: 120)

        NSLayoutConstraint.activate([self.imageTopConstraint, imageLeadingConstraint, imageHeightConstraint, imageWidthConstraint].compactMap({$0}))
    }

}

