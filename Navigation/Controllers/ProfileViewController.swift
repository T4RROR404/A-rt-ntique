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
        let tap = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
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
        textField.alpha = 0
        view.addSubview(textField)

        showButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        showButton.setTitle("Create Status", for: .normal)
        showButton.backgroundColor = .systemBlue
        showButton.layer.cornerRadius = 7
        showButton.layer.shadowColor = UIColor.black.cgColor
        showButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        showButton.layer.shadowRadius = 5
        showButton.layer.shadowOpacity = 0.3
        view.addSubview(showButton)

        
        status.backgroundColor = .systemGray2
        status.font = .systemFont(ofSize: 20)
        status.textColor = .systemGray
        status.text = "status"
        view.addSubview(status)
    }

    @objc func buttonPressed() {
        status.text = textField.text
        status.textColor = .black
        textField.text = ""
        UIView.animate(withDuration: 1.0) {
            self.showButton.frame = CGRect(x: 55, y: 428, width: 300, height: 60)
            self.textField.alpha = 1
            self.view.endEditing(true)
            if self.status.hasText {
                self.showButton.setTitle("Change Status", for: .normal)
                self.textField.alpha = 0
                self.showButton.frame = CGRect(x: 55, y: 400, width: 300, height: 60)
            }
        }
    }
    @objc func tap(_ sender: Any) {
        textField.resignFirstResponder()
    }
}

