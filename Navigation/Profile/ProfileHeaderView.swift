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
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        
        let profileImage = UIImage(named: "portrait")
        let profileImageView = UIImageView(image: profileImage)
        profileImageView.frame = CGRect(x: 35, y: 150, width: 150, height: 230)
        self.addSubview(profileImageView)
        
        let name = UILabel(frame: CGRect(x: 220, y: 170, width: 200, height: 80))
        name.text = "K1LL B1LL"
        name.font = .systemFont(ofSize: 30, weight: .bold)
        self.addSubview(name)
        
        let showButton = UIButton(frame: CGRect(x: 55, y: 410, width: 300, height: 60))
        showButton.setTitle("Show Status", for: .normal)
        showButton.backgroundColor = .systemBlue
        showButton.layer.cornerRadius = 15
        self.addSubview(showButton)

    }
}
