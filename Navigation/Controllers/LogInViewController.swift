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
//        self.tabBarController?.tabBar.isHidden = true

    }
    
    private let scrollFieldView: UIScrollView = {
        let scrollFieldView = UIScrollView()
        scrollFieldView.translatesAutoresizingMaskIntoConstraints = false
        return scrollFieldView
    } ()
    
    private let singLabel: UILabel = {
        let singLabel = UILabel()
        singLabel.text = "Sing in to A(rt)ntique"
        singLabel.textColor = .systemGray2
        singLabel.font = .systemFont(ofSize: 15, weight: .light)
        singLabel.adjustsFontSizeToFitWidth = true
        singLabel.minimumScaleFactor = 0.5
        return singLabel
    } ()
    
    lazy var loginField: UITextField = {
        let loginField = UITextField()
        loginField.placeholder = "Enter login..."
        loginField.adjustsFontSizeToFitWidth = true
        loginField.minimumFontSize = 0.5
        loginField.returnKeyType = .done
        loginField.autocapitalizationType = .words
        loginField.font = .systemFont(ofSize: 15)
        loginField.textColor = .black
        loginField.backgroundColor = .systemGray5
        loginField.borderStyle = .roundedRect
        loginField.returnKeyType = .next
        loginField.keyboardType = .default
        loginField.clearButtonMode = .always
        loginField.translatesAutoresizingMaskIntoConstraints = false
        return loginField
    } ()
    
     lazy var passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.placeholder = "Enter password..."
        passwordField.adjustsFontSizeToFitWidth = true
        passwordField.minimumFontSize = 0.5
        passwordField.returnKeyType = .done
        passwordField.autocapitalizationType = .words
        passwordField.font = .systemFont(ofSize: 15)
        passwordField.textColor = .black
        passwordField.backgroundColor = .systemGray5
        passwordField.borderStyle = .roundedRect
        passwordField.returnKeyType = .default
        passwordField.keyboardType = .default
        passwordField.clearButtonMode = .always
        passwordField.isSecureTextEntry = true
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        return passwordField
    } ()
    
    let logoImage: UIImageView = {
        let logo = UIImage(named: "logo")
        let logoImage = UIImageView(image: logo)
        logoImage.layer.cornerRadius = 7
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let tap = UITapGestureRecognizer(target: self, action: #selector(kbdHide))
        view.addGestureRecognizer(tap)
        NotificationCenter.default.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        loginField.delegate = self
        passwordField.delegate = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name:UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func kbdShow(_ notification: NSNotification) {
        UIView.animate(withDuration: 0.3) {
            if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as?NSValue)?.cgRectValue {
                self.scrollFieldView.contentInset.bottom = kbdSize.height
                let kbdSizeMoove = kbdSize.height
                self.scrollFieldView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0,left: 0, bottom: kbdSizeMoove, right: 0)
            }
        }
    }
    
    @objc private func kbdHide(_ notification: NSNotification) {
        UIView.animate(withDuration: 0.3) {
            self.scrollFieldView.contentInset.bottom = .zero
            self.scrollFieldView.verticalScrollIndicatorInsets = .zero
            self.view.endEditing(true)
        }
    }
    
    private func addConstraint() {
        
        view.addSubview(scrollFieldView)
        view.addSubview(logoImage)
        scrollFieldView.addSubview(fieldStackView)
        scrollFieldView.addSubview(loginButton)
        fieldStackView.addArrangedSubview(singLabel)
        fieldStackView.addArrangedSubview(loginField)
        fieldStackView.addArrangedSubview(passwordField)

        var constraints = [NSLayoutConstraint]()
        
        constraints.append(scrollFieldView.topAnchor.constraint(equalTo: logoImage.bottomAnchor))
        constraints.append(scrollFieldView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(scrollFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(scrollFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(scrollFieldView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        
        constraints.append(fieldStackView.topAnchor.constraint(equalTo: scrollFieldView.topAnchor, constant: 120))
        constraints.append(fieldStackView.centerXAnchor.constraint(equalTo: scrollFieldView.centerXAnchor))
        let leadingStackConstraint = fieldStackView.leadingAnchor.constraint(equalTo: scrollFieldView.leadingAnchor)
        let trailingStackConstraint = fieldStackView.trailingAnchor.constraint(equalTo: scrollFieldView.trailingAnchor)
        leadingStackConstraint.priority = UILayoutPriority(999)
        trailingStackConstraint.priority = UILayoutPriority(999)
        constraints.append(leadingStackConstraint)
        constraints.append(trailingStackConstraint)
        
        constraints.append(logoImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor))
        constraints.append(logoImage.widthAnchor.constraint(equalToConstant: 230))
        constraints.append(logoImage.heightAnchor.constraint(equalToConstant: 230))
        constraints.append(logoImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 58))
        
        constraints.append(loginButton.topAnchor.constraint(equalTo: self.fieldStackView.bottomAnchor, constant: 50))
        constraints.append(loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor))
        constraints.append(loginButton.widthAnchor.constraint(equalToConstant: 150))
        constraints.append(loginButton.heightAnchor.constraint(equalToConstant: 50))
        
        NSLayoutConstraint.activate(constraints)
        
        for view in fieldStackView.arrangedSubviews {
            NSLayoutConstraint.activate([
                view.widthAnchor.constraint(equalToConstant: 200),
                view.heightAnchor.constraint(equalToConstant: 40)
            ])
        }
    }
}
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordField.becomeFirstResponder()
    }
}
