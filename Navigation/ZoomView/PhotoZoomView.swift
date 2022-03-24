//
//  PhotoZoomView.swift
//  Navigation
//
//  Created by insomnia on 24.03.2022.
//

import UIKit

class PhotoZoomView: UIView {
        
    lazy var photo: UIImageView = {
        let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
    
    private lazy var exitButton: UIButton = {
        let exitButton = UIButton()
        exitButton.setTitle("X", for: .normal)
        exitButton.addTarget(self, action: #selector(exitPressed), for: .touchUpInside)
        exitButton.backgroundColor = .gray
        exitButton.layer.cornerRadius = 10
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        return exitButton
    }()
    
    func set(image: PhotosView) {
        
        photo.image = image.imageName
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        self.backgroundColor = .white
        self.alpha = 0
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {

        self.addSubview(exitButton)
        self.addSubview(photo)
        
        NSLayoutConstraint.activate([
            
            exitButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            exitButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            exitButton.heightAnchor.constraint(equalToConstant: 40),
            exitButton.widthAnchor.constraint(equalToConstant: 40),
            
            photo.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            photo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            photo.heightAnchor.constraint(equalToConstant: 300),
            photo.widthAnchor.constraint(equalToConstant: 300)


        ])
    }
    
    @objc private func exitPressed() {
        
        UIView.animate(withDuration: 0.5) {
            self.alpha = 0
        }
    }
}


