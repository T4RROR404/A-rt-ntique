//
//  PhotosViewController.swift
//  Navigation
//
//  Created by insomnia on 09.03.2022.
//


import UIKit

class PhotosViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        addConstraint()
//        self.tabBarController?.tabBar.isHidden = true

    }
    
    private func addConstraint() {
        

        var constraints = [NSLayoutConstraint]()
        
        NSLayoutConstraint.activate(constraints)
        
    }
}

