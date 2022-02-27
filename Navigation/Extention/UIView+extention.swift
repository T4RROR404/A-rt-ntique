//
//  UIView+extention.swift
//  Navigation
//
//  Created by insomnia on 26.02.2022.
//

import UIKit

extension UIView {
    
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor, constant: 200).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: 200).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: 200).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 200).isActive = true
    }
}
