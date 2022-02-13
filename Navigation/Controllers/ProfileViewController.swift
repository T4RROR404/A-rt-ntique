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
    }
    
    override func viewWillLayoutSubviews() {
        let profileView = ProfileHeaderView()
        profileView.frame = self.view.frame
    }
    public let textField = UITextField(frame: CGRect(x: 195, y: 280, width: 190, height: 50))
    let showButton = UIButton(frame: CGRect(x: 55, y: 410, width: 300, height: 60))

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

        showButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        showButton.setTitle("Show Status", for: .normal)
        showButton.backgroundColor = .systemBlue
        showButton.layer.cornerRadius = 7
        showButton.layer.shadowColor = UIColor.black.cgColor
        showButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        showButton.layer.shadowRadius = 5
        showButton.layer.shadowOpacity = 0.3
        view.addSubview(showButton)
    }

    @objc func buttonPressed() {
        let txtField:String = textField.text!
        print(txtField)
    }
}

