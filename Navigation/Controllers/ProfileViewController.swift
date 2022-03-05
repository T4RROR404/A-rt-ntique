//
//  ProfileViewController.swift
//  Navigation
//
//  Created by insomnia on 11.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileTableHeaderView: UIView = {
        let profileTableHeaderView = ProfileTableHederView()
        profileTableHeaderView.translatesAutoresizingMaskIntoConstraints = false
        profileTableHeaderView.backgroundColor = .white
        return profileTableHeaderView
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        configureSubviews()
        setupConstraints()
    }
    
    private func configureSubviews() {
        
        view.addSubview(profileTableHeaderView)
    }
        
    private func setupConstraints() {
        
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(profileTableHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(profileTableHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(profileTableHeaderView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        constraints.append(profileTableHeaderView.topAnchor.constraint(equalTo: view.topAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
}

