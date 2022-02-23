//
//  LogInViewController.swift
//  Navigation
//
//  Created by insomnia on 23.02.2022.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addConstraint()
        self.tabBarController?.tabBar.isHidden = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        view.addGestureRecognizer(tap)
        
    }
    
    private lazy var loginField: UITextField = {
        let loginField = UITextField()
        loginField.placeholder = "Enter login..."
        loginField.adjustsFontSizeToFitWidth = true
        loginField.minimumFontSize = 0.5
        loginField.returnKeyType = .done
        loginField.autocapitalizationType = .words
        loginField.font = .systemFont(ofSize: 15)
        loginField.textColor = .systemGray2
        loginField.backgroundColor = .systemGray6
        loginField.borderStyle = .roundedRect
        loginField.returnKeyType = .next
        loginField.keyboardType = .default
        loginField.clearButtonMode = .always
        loginField.translatesAutoresizingMaskIntoConstraints = false
        return loginField
    } ()
    
    private lazy var passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.placeholder = "Enter password..."
        passwordField.adjustsFontSizeToFitWidth = true
        passwordField.minimumFontSize = 0.5
        passwordField.returnKeyType = .done
        passwordField.autocapitalizationType = .words
        passwordField.font = .systemFont(ofSize: 15)
        passwordField.textColor = .systemGray2
        passwordField.backgroundColor = .systemGray6
        passwordField.borderStyle = .roundedRect
        passwordField.returnKeyType = .next
        passwordField.keyboardType = .default
        passwordField.clearButtonMode = .always
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        return passwordField
    } ()
    
    let logoImage: UIImageView = {
        let logo = UIImage(named: "logo")
        let logoImage = UIImageView(image: logo)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        return logoImage
    } ()
    
    private lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        loginButton.setTitle("Log In", for: .normal)
        loginButton.backgroundColor = .systemGray2
        loginButton.layer.cornerRadius = 7
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        return loginButton
    }()
    
    @objc func buttonPressed() {
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    private lazy var fieldStackView: UIStackView = {
        let fieldStackView = UIStackView()
        fieldStackView.axis = .vertical
        fieldStackView.distribution = .fillEqually
        fieldStackView.spacing = 0
        fieldStackView.translatesAutoresizingMaskIntoConstraints = false
        return fieldStackView
    }()
    
    @objc func tap(_ sender: Any) {
        loginField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }

    private func addConstraint() {
        
        view.addSubview(fieldStackView)
        view.addSubview(logoImage)
        view.addSubview(loginButton)
        fieldStackView.addArrangedSubview(loginField)
        fieldStackView.addArrangedSubview(passwordField)
        
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(fieldStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(fieldStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        constraints.append(fieldStackView.heightAnchor.constraint(equalToConstant: 90))
        constraints.append(fieldStackView.widthAnchor.constraint(equalToConstant: 250))
        
        constraints.append(logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(logoImage.widthAnchor.constraint(equalToConstant: 210))
        constraints.append(logoImage.heightAnchor.constraint(equalToConstant: 210))
        constraints.append(logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10))
        
        constraints.append(loginButton.topAnchor.constraint(equalTo: fieldStackView.bottomAnchor, constant: 30))
        constraints.append(loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(loginButton.widthAnchor.constraint(equalToConstant: 150))
        constraints.append(loginButton.heightAnchor.constraint(equalToConstant: 50))
        
 
        
        NSLayoutConstraint.activate(constraints)
        
        
    }
    
}
