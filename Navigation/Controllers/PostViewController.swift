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
        let titleLabel = UILabel()
        titleLabel.text = "Post"
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        let infoImage = UIImage(named: "info")
        let infoButton = UIBarButtonItem(image: infoImage , style: .done, target: self, action: #selector(buttonInfoClicked))
        navigationItem.rightBarButtonItem = infoButton
    }
    
    @objc func buttonInfoClicked() {
        let infoViewController = InfoViewController()
        navigationController?.pushViewController(infoViewController, animated: true)
    }
}
