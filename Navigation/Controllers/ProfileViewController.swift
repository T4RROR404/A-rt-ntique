//
//  ProfileViewController.swift
//  Navigation
//
//  Created by insomnia on 11.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Profile"
        let profileHeaderView = ProfileHeaderView()
        view.addSubview(profileHeaderView)
        setupView()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    override func viewWillLayoutSubviews() {
        let profileView = ProfileHeaderView()
        profileView.frame = self.view.frame
    }
    let textField = UITextField(frame: CGRect(x: 200, y: 360, width: 190, height: 50))
    let showButton = UIButton(frame: CGRect(x: 55, y: 400, width: 300, height: 60))
    let status = UITextView(frame: CGRect(x: 200, y: 290, width: 190, height: 50))

    private func setupView() {
        textField.placeholder = "Waiting with something..."
        textField.returnKeyType = .done
        textField.autocapitalizationType = .words
        textField.font = .systemFont(ofSize: 15)
        textField.textColor = .systemGray2
        textField.backgroundColor = .systemGray4
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .next
        textField.keyboardType = .default
        textField.clearButtonMode = .always
        view.addSubview(textField)
        textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 35).isActive = true
        textField.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        textField.alpha = 0

        showButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        showButton.setTitle("Create Status", for: .normal)
        showButton.backgroundColor = .systemBlue
        showButton.layer.cornerRadius = 7
        showButton.layer.shadowColor = UIColor.black.cgColor
        showButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        showButton.layer.shadowRadius = 5
        showButton.layer.shadowOpacity = 0.3
        view.addSubview(showButton)
        showButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        showButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        
        status.backgroundColor = .systemGray2
        status.font = .systemFont(ofSize: 20)
        status.textColor = .systemGray
        status.text = "status"
        view.addSubview(status)
        status.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 35).isActive = true
        status.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }

    @objc func buttonPressed() {
        status.text = textField.text
        status.textColor = .black
        UIView.animate(withDuration: 2.0) {
            self.showButton.center = self.view.center
            self.textField.alpha = 1
            self.view.endEditing(true)
        }
    }
}

