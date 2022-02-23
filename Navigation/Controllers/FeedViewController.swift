//
//  FeedViewController.swift
//  Navigation
//
//  Created by insomnia on 11.02.2022.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Feed"
        addConstraint()
    }
    
    @objc func buttonClicked() {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
    }
    
    private lazy var postButton1: UIButton = {
        let postButton1 = UIButton()
        postButton1.addTarget(self, action: #selector(bClicked), for: .touchUpInside)
        postButton1.setTitle("open", for: .normal)
        postButton1.backgroundColor = .systemGray2
        postButton1.layer.cornerRadius = 10
        postButton1.translatesAutoresizingMaskIntoConstraints = false
        return postButton1
    }()
    
    private lazy var postButton2: UIButton = {
        let postButton2 = UIButton()
        postButton2.addTarget(self, action: #selector(bClicked), for: .touchUpInside)
        postButton2.setTitle("open2", for: .normal)
        postButton2.backgroundColor = .systemGray2
        postButton2.layer.cornerRadius = 10
        postButton2.translatesAutoresizingMaskIntoConstraints = false
        return postButton2
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let buttonStackView = UIStackView()
        buttonStackView.axis = .vertical
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 10
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        return buttonStackView
    }()
    
    @objc func bClicked() {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
    }
    
    private func addConstraint() {
        
        var constraints = [NSLayoutConstraint]()
        view.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(postButton1)
        buttonStackView.addArrangedSubview(postButton2)
        constraints.append(buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(buttonStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        constraints.append(buttonStackView.widthAnchor.constraint(equalToConstant: 150))
        constraints.append(buttonStackView.heightAnchor.constraint(equalToConstant: 90))
        NSLayoutConstraint.activate(constraints)
    }
}

struct Post {
    
    let title:String = "post"
}


