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

        
        let name = UILabel(frame: CGRect(x: 215, y: 190, width: 200, height: 80))
        name.text = "K1LL B1LL"
        name.font = .systemFont(ofSize: 35, weight: .bold)
        self.addSubview(name)
    }   
}
