//
//  InfoViewController.swift
//  Navigation
//
//  Created by insomnia on 12.02.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        title = "Info"
        let button = UIButton(frame: CGRect(x: 130, y: 770, width: 150, height: 40))
        view.addSubview(button)
        button.setTitle("Show alert", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(alertClicked), for: .touchUpInside)

    }
    @objc func alertClicked() {
        let alert = UIAlertController(title: "Attention", message: "Message", preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "yep", style: .cancel, handler: nil)
        alert.addAction(okBtn)
        present(alert, animated: true, completion: nil)
    }
}
