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
        addConstraints()
        let tap = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        self.addGestureRecognizer(tap)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private lazy var name: UILabel = {
        let name = UILabel()
        name.text = "K1LL B1LL"
        name.font = .systemFont(ofSize: 35, weight: .bold)
        name.adjustsFontSizeToFitWidth = true
        name.minimumScaleFactor = 0.5
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var status: UITextView = {
        let status = UITextView()
        status.backgroundColor = #colorLiteral(red: 0.8745098039, green: 0.8745098039, blue: 0.8745098039, alpha: 1)
        status.font = .systemFont(ofSize: 20)
        status.textColor = .systemGray
        status.text = " status"
        status.layer.cornerRadius = 7
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Waiting with something..."
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 0.5
        textField.returnKeyType = .done
        textField.autocapitalizationType = .words
        textField.font = .systemFont(ofSize: 15)
        textField.textColor = .systemGray2
        textField.backgroundColor = .white
        textField.borderStyle = .none
        textField.returnKeyType = .next
        textField.keyboardType = .default
        textField.clearButtonMode = .always
        textField.layer.cornerRadius = 7
//        textField.alpha = 0
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    } ()
    
    private lazy var showButton: UIButton = {
        let showButton = UIButton()
        showButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        showButton.setTitle("Create Status", for: .normal)
        showButton.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        showButton.layer.cornerRadius = 7
        showButton.layer.shadowColor = UIColor.black.cgColor
        showButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        showButton.layer.shadowRadius = 5
        showButton.layer.shadowOpacity = 0.3
        showButton.translatesAutoresizingMaskIntoConstraints = false
        return showButton
    }()
    
//    private lazy var newButton: UIButton = {
//        let newButton = UIButton()
//        newButton.setTitle("edit profile", for: .normal)
//        newButton.backgroundColor = .gray
//        newButton.layer.cornerRadius = 7
//        newButton.translatesAutoresizingMaskIntoConstraints = false
//        return newButton
//    }()

    lazy var avatarImage: UIImageView = {
        let portrait = UIImage(named: "portrait")
        let avatarImage = UIImageView(image: portrait)
        avatarImage.layer.shadowColor = UIColor.black.cgColor
        avatarImage.layer.shadowOffset = CGSize(width: 10, height: 10)
        avatarImage.layer.shadowRadius = 10
        avatarImage.layer.shadowOpacity = 0.3
        avatarImage.isUserInteractionEnabled = true
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        return avatarImage
    } ()

    @objc func buttonPressed() {
        status.text = textField.text
        status.textColor = .black
        textField.text = ""
        self.endEditing(true)
        if self.status.hasText {
            self.showButton.setTitle("Change Status", for: .normal)
        }
    }
    
    @objc func tap(_ sender: Any) {
        textField.resignFirstResponder()
    }
    
    private lazy var labelStackView: UIStackView = {
        let labelstackView = UIStackView()
        labelstackView.axis = .vertical
        labelstackView.distribution = .fillEqually
        labelstackView.spacing = 15
        labelstackView.translatesAutoresizingMaskIntoConstraints = false
        return labelstackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private func addConstraints() {
        
        self.addSubview(stackView)
        stackView.addArrangedSubview(avatarImage)
        stackView.addArrangedSubview(labelStackView)
        labelStackView.addArrangedSubview(name)
        labelStackView.addArrangedSubview(status)
        labelStackView.addArrangedSubview(textField)
        labelStackView.addArrangedSubview(showButton)
        
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor))
        constraints.append(stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10))
        constraints.append(stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20))
        constraints.append(stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20))
        constraints.append(stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -25))

        NSLayoutConstraint.activate(constraints)
    }
}
