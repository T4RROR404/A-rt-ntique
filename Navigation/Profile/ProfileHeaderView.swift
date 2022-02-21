//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by insomnia on 13.02.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        let tap = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        self.addGestureRecognizer(tap)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    let textField = UITextField(frame: CGRect(x: 200, y: 290, width: 160, height: 50))
    let showButton = UIButton(frame: CGRect(x: 200, y: 290, width: 160, height: 50))
    let status = UITextView(frame: CGRect(x: 200, y: 210, width: 160, height: 50))
    
    private func setupView() {
        
        let profileImage = UIImage(named: "portrait")
        let profileImageView = UIImageView(image: profileImage)
        profileImageView.frame = CGRect(x: 35, y: 120, width: 150, height: 230)
        self.addSubview(profileImageView)

        let name = UILabel(frame: CGRect(x: 200, y: 120, width: 200, height: 80))
        name.text = "K1LL B1LL"
        name.font = .systemFont(ofSize: 35, weight: .bold)
        name.adjustsFontSizeToFitWidth = true
        name.minimumScaleFactor = 0.5
        self.addSubview(name)

        textField.placeholder = "Waiting with something..."
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 0.5
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
        self.addSubview(textField)

        showButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        showButton.setTitle("Create Status", for: .normal)
        showButton.backgroundColor = .systemBlue
        showButton.layer.cornerRadius = 7
        showButton.layer.shadowColor = UIColor.black.cgColor
        showButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        showButton.layer.shadowRadius = 5
        showButton.layer.shadowOpacity = 0.3
        self.addSubview(showButton)

        status.backgroundColor = .systemGray2
        status.font = .systemFont(ofSize: 20)
        status.textColor = .systemGray
        status.text = "status"
        self.addSubview(status)
    }

    @objc func buttonPressed() {
        status.text = textField.text
        status.textColor = .black
        textField.text = ""
        UIView.animate(withDuration: 1.0) {
            self.showButton.frame = CGRect(x: 200, y: 370, width: 160, height: 50)
            self.textField.alpha = 1
            self.endEditing(true)
            if self.status.hasText {
                self.showButton.setTitle("Change Status", for: .normal)
                self.textField.alpha = 0
                self.showButton.frame = CGRect(x: 200, y: 290, width: 160, height: 50)
            }
        }
    }
    @objc func tap(_ sender: Any) {
        textField.resignFirstResponder()
    }
}
