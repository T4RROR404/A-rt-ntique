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
        self.navigationController?.isNavigationBarHidden = true
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
    
    private lazy var invalidLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 5
        label.contentMode = .scaleToFill
        label.textAlignment = .center
        label.isHidden = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var validationData = ValidationData()
    
    private func validEmail(login: String) -> Bool {
        let emailReg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let validEmail = NSPredicate(format:"SELF MATCHES %@", emailReg)
        return validEmail.evaluate(with: login)
    }

    private func validPassword(password : String) -> Bool {
        let passwordReg =  ("(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z])(?=.*[@#$%^&*]).{8,}")
        let passwordTesting = NSPredicate(format: "SELF MATCHES %@", passwordReg)
        return passwordTesting.evaluate(with: password) && password.count > 6
    }
    
    @objc func buttonPressed() {
        let profileViewController = ProfileViewController()
        guard let login = loginField.text else {return}
        guard let password = passwordField.text else {return}
        let enteredLogin = validEmail(login: login)
        let enteredPassword = validPassword(password: password)
//        if login.isEmpty && password.isEmpty {
//            loginField.trigger()
//            passwordField.trigger()
//        } else if login.isEmpty {
//            loginField.trigger()
//        } else if password.isEmpty {
//            passwordField.trigger()
//        } else {
//            if !enteredPassword && !enteredLogin {
//                invalidLabel.text = validationData.invalidEmailAndPassword
//                invalidLabel.isHidden = false
//                passwordField.trigger()
//                loginField.trigger()
//            } else if !enteredPassword {
//                invalidLabel.text = validationData.invalidPassword
//                invalidLabel.isHidden = false
//                passwordField.trigger()
//            } else if !enteredLogin {
//                invalidLabel.text = validationData.invalidEmail
//                invalidLabel.isHidden = false
//                loginField.trigger()
//            } else {
//                if (enteredLogin && enteredPassword) && (loginField.text != validationData.defaultLogin || passwordField.text != validationData.defaultPassword) {
//                    let alert = UIAlertController(title: "Invalid login or password", message: nil, preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                    present(alert, animated: true, completion: nil)
//                } else {
                    navigationController?.pushViewController(profileViewController, animated: true)
                    invalidLabel.isHidden = true
//                }
//            }
//        }
    }
    
    private lazy var fieldStackView: UIStackView = {
        let fieldStackView = UIStackView()
        fieldStackView.axis = .vertical
        fieldStackView.distribution = .fillEqually
        fieldStackView.spacing = 0
        fieldStackView.translatesAutoresizingMaskIntoConstraints = false
        return fieldStackView
    }()
    
    private func addTapGestureToHideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillHideNotification, object: nil)
        addTapGestureToHideKeyboard()
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
            if let kbdSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardRectangle = kbdSize.cgRectValue
                let keyboardHeight = keyboardRectangle.height
                let contentOffset: CGPoint = notification.name == UIResponder.keyboardWillHideNotification
                ? .zero
                : CGPoint(x: 0, y: keyboardHeight / 2)
                self.scrollFieldView.contentOffset = contentOffset
            }
        }
    }
    
    @objc private func kbdHide(_ notification: NSNotification) {
        UIView.animate(withDuration: 0.3) {
            self.scrollFieldView.contentInset.bottom = .zero
            self.scrollFieldView.verticalScrollIndicatorInsets = .zero
        }
    }
    
    private func addConstraint() {
        
        view.addSubview(scrollFieldView)
        scrollFieldView.addSubview(logoImage)
        scrollFieldView.addSubview(fieldStackView)
        scrollFieldView.addSubview(loginButton)
        scrollFieldView.addSubview(invalidLabel)
        fieldStackView.addArrangedSubview(singLabel)
        fieldStackView.addArrangedSubview(loginField)
        fieldStackView.addArrangedSubview(passwordField)

        var constraints = [NSLayoutConstraint]()
        
        constraints.append(scrollFieldView.topAnchor.constraint(equalTo: view.topAnchor))
        constraints.append(scrollFieldView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(scrollFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(scrollFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(scrollFieldView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        
        constraints.append(fieldStackView.topAnchor.constraint(lessThanOrEqualTo: logoImage.bottomAnchor, constant: 30))
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
        constraints.append(logoImage.topAnchor.constraint(equalTo: self.scrollFieldView.topAnchor, constant: 58))
        
        constraints.append(loginButton.topAnchor.constraint(equalTo: self.fieldStackView.bottomAnchor, constant: 80))
        constraints.append(loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor))
        constraints.append(loginButton.widthAnchor.constraint(equalToConstant: 150))
        constraints.append(loginButton.heightAnchor.constraint(equalToConstant: 50))
        let loginButtonBottomAnchor = loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        loginButtonBottomAnchor.priority = UILayoutPriority(999)
        constraints.append(loginButtonBottomAnchor)
        
        constraints.append(invalidLabel.topAnchor.constraint(equalTo: fieldStackView.bottomAnchor, constant: 5))
        constraints.append(invalidLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor))
        constraints.append(invalidLabel.widthAnchor.constraint(equalToConstant: 200))
        
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
        passwordField.resignFirstResponder()
    }
}
