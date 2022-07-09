//
//  ViewController.swift
//  BankeyClone
//
//  Created by Dinh Toai on 09/07/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLable = UILabel()
    let messageHeaderLable = UILabel()
    let nameAppLable = UILabel()
    
    var username : String? {
        return loginView.usernameTextfield.text
    }
    
    var password : String? {
        return loginView.passwordTextfiled.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

//MARK - Action
extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        errorMessageLable.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username / password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage:("Username / password should never be nil "))
            return
        }
        
        if username == "Kevin" && password == "Welcome" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorrect username / password ")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLable.isHidden = false
        errorMessageLable.text = message
    }
}

extension LoginViewController {
    
    func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLable.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLable.textAlignment = .center
        errorMessageLable.numberOfLines = 0
        errorMessageLable.textColor = .systemRed
        errorMessageLable.isHidden = true
        
        messageHeaderLable.translatesAutoresizingMaskIntoConstraints = false
        messageHeaderLable.textAlignment =  .center
        messageHeaderLable.numberOfLines = 0
        messageHeaderLable.font = .systemFont(ofSize: 25)
        messageHeaderLable.text = "Your premium source for all things banking!"
        
        nameAppLable.translatesAutoresizingMaskIntoConstraints = false
        nameAppLable.textAlignment = .center
        nameAppLable.font = .systemFont(ofSize: 30)
        nameAppLable.text = "Bankey"
    }
    
    func layout() {
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLable)
        view.addSubview(messageHeaderLable)
        view.addSubview(nameAppLable)
        
        //LoginVew
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView .trailingAnchor, multiplier: 1)
        ])
        
        //Button Sign In
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
            
        ])
        
        //Error Lable
        
        NSLayoutConstraint.activate([
            errorMessageLable.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 3),
            errorMessageLable.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            errorMessageLable.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor)
        ])
        // Title header message
        NSLayoutConstraint.activate([
            messageHeaderLable.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -20),
            messageHeaderLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageHeaderLable.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width*3/4)
        ])
        
        //Name app
        
        NSLayoutConstraint.activate([
            nameAppLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageHeaderLable.topAnchor.constraint(equalToSystemSpacingBelow: nameAppLable.bottomAnchor, multiplier: 2)
        ])
    }
}



