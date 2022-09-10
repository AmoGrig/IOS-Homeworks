//
//  LogInViewController ViewController.swift
//  Navigation
//
//  Created by ARAM on 11.06.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var vkLogo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "VKLogo")
        logo.clipsToBounds = true
        logo.layer.cornerRadius = 10
        logo.translatesAutoresizingMaskIntoConstraints = false
    
        return logo
    }()
    
    private lazy var loginField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "  Email or phone"
        textField.textColor = .black
        textField.tintColor = UIColor(named: "Accent Color")
        textField.layer.borderColor = UIColor(named: "BorderColor")?.cgColor
        textField.backgroundColor = .systemGray6
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var passField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "  Password"
        textField.isSecureTextEntry = true
        textField.textColor = .black
        textField.tintColor = UIColor(named: "Accent Color")
        textField.layer.borderColor = UIColor(named: "BorderColor")?.cgColor
        textField.backgroundColor = .systemGray6
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
       let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setBackgroundImage(UIImage(named: "BluePixel")?.alpha(1), for: .normal)
        button.setBackgroundImage(UIImage(named: "BluePixel")?.alpha(0.8), for: .selected)
        button.setBackgroundImage(UIImage(named: "BluePixel")?.alpha(0.8), for: .highlighted)
        button.setBackgroundImage(UIImage(named: "BluePixel")?.alpha(0.8), for: .disabled)
        
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    @objc func loginButtonAction() {
        let profileViewController = ProfileViewController()
        let userService = CurrentUserService()
        let testUserService = TestUserService()
        
        if let loginText = loginField.text {
            #if DEBUG
            let login = userService.data(login: loginText)
            if login?.login == loginText {
                self.navigationController?.pushViewController(profileViewController, animated: true)
            } else {
                let alert = UIAlertController(title: "Incorrect login", message: "Login: Aram", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default)
                alert.addAction(action)
                present(alert, animated: true)
            }
            #else
            let login = testUserService.data(login: loginText)
            if login?.login == loginText {
                self.navigationController?.pushViewController(profileViewController, animated: true)
            } else {
                let alert = UIAlertController(title: "Incorrect login", message: "Login: Aramtest", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default)
                alert.addAction(action)
                present(alert, animated: true)
            }
            #endif
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        setupView()
    }
    
    func setupView() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(vkLogo)
        scrollView.addSubview(loginField)
        scrollView.addSubview(passField)
        scrollView.addSubview(loginButton)
        scrollView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        
        NSLayoutConstraint.activate([
            vkLogo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            vkLogo.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            vkLogo.heightAnchor.constraint(equalToConstant: 100),
            vkLogo.widthAnchor.constraint(equalToConstant: 100),
            
            loginField.topAnchor.constraint(equalTo: vkLogo.bottomAnchor, constant: 120),
            loginField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginField.heightAnchor.constraint(equalToConstant: 50),
            
            passField.topAnchor.constraint(equalTo: loginField.bottomAnchor),
            passField.leadingAnchor.constraint(equalTo: loginField.leadingAnchor),
            passField.trailingAnchor.constraint(equalTo: loginField.trailingAnchor),
            passField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: passField.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: passField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: passField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        NotificationCenter.default.addObserver(self, selector: #selector(didShowKeyboard(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didHideKeyboard(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    @objc private func didShowKeyboard(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            let loginButtonBottomPointY = scrollView.frame.origin.y + self.loginButton.frame.origin.y + self.loginButton.frame.height
            let keyboardOriginY = self.view.frame.height - keyboardHeight
            
            let yOffset = keyboardOriginY < loginButtonBottomPointY ? loginButtonBottomPointY - keyboardOriginY + 16 : 0
            
            scrollView.contentOffset = CGPoint(x: 0, y: yOffset)
            
        }
    }
    
    @objc private func didHideKeyboard(_ notification: Notification) {
        hideKeyboard()
    }
    
}
