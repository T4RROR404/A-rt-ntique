//
//  PostViewController.swift
//  Navigation
//
//  Created by insomnia on 12.02.2022.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        let myPost = Post()
        let titleLabel = UILabel()
        titleLabel.text = myPost.title
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
    }

}
