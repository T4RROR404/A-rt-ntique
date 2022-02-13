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
        let textField = UITextField(frame: CGRect(x: 195, y: 280, width: 190, height: 50))
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
    }
    override func viewWillLayoutSubviews() {
        let profileView = ProfileHeaderView()
        profileView.frame = self.view.frame
        
    }
}
