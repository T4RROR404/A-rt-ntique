//
//  AvatarZoomView.swift
//  Navigation
//
//  Created by insomnia on 24.03.2022.
//

import UIKit

class AvatarZoomView: UIView {
    
    let profileView = ProfileHeaderView()
    
    private lazy var avatarImage: UIImageView = {
        let portrait = UIImage(named: "portrait")
        let avatarImage = UIImageView(image: portrait)
        avatarImage.layer.shadowColor = UIColor.black.cgColor
        avatarImage.layer.shadowOffset = CGSize(width: 10, height: 10)
        avatarImage.layer.shadowRadius = 10
        avatarImage.layer.shadowOpacity = 0.3
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        return avatarImage
    } ()
    
    private lazy var exitButton: UIButton = {
        let exitButton = UIButton()
        exitButton.setTitle("X", for: .normal)
        exitButton.addTarget(self, action: #selector(exitPressed), for: .touchUpInside)
        exitButton.backgroundColor = .gray
        exitButton.layer.cornerRadius = 10
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        return exitButton
    }()
    
    private lazy var descriptionAvatar: UILabel = {
        let descriptionAvatar = UILabel()
        descriptionAvatar.font = .systemFont(ofSize: 12, weight: .light)
        descriptionAvatar.numberOfLines = 100
        descriptionAvatar.textAlignment = .center
        descriptionAvatar.text = "Bill Gates, in full William Henry Gates III, (born October 28, 1955, Seattle, Washington, U.S.), American computer programmer and entrepreneur who cofounded Microsoft Corporation, the world’s largest personal-computer software company.Gates wrote his first software program at the age of 13. In high school he helped form a group of programmers who computerized their school’s payroll system and founded Traf-O-Data, a company that sold traffic-counting systems to local governments. In 1975 Gates, then a sophomore at Harvard University, joined his hometown friend Paul G."
        descriptionAvatar.translatesAutoresizingMaskIntoConstraints = false
        return descriptionAvatar
    }()
    
    @objc func exitPressed() {

        UIView.animate(withDuration: 0.5) {
            self.alpha = 0
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTableView()
        self.backgroundColor = .white
        self.alpha = 0
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureTableView() {
        
        self.addSubview(exitButton)
        self.addSubview(avatarImage)
        self.addSubview(descriptionAvatar)
        
        var constraints = [NSLayoutConstraint] ()
        
        constraints.append(exitButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 80))
        constraints.append(exitButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30))
        constraints.append(exitButton.heightAnchor.constraint(equalToConstant: 30))
        constraints.append(exitButton.widthAnchor.constraint(equalToConstant: 30))
        
        constraints.append(avatarImage.topAnchor.constraint(equalTo: exitButton.bottomAnchor, constant: 30))
        constraints.append(avatarImage.leadingAnchor.constraint(lessThanOrEqualTo: self.leadingAnchor, constant: 150))
        constraints.append(avatarImage.trailingAnchor.constraint(greaterThanOrEqualTo: self.trailingAnchor, constant: -150))
        constraints.append(avatarImage.heightAnchor.constraint(lessThanOrEqualToConstant: 350))
        constraints.append(avatarImage.centerXAnchor.constraint(equalTo: self.centerXAnchor))
        
        constraints.append(descriptionAvatar.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 20))
        constraints.append(descriptionAvatar.bottomAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20))
        constraints.append(descriptionAvatar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30))
        constraints.append(descriptionAvatar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30))
        
        NSLayoutConstraint.activate(constraints)
    }
}
