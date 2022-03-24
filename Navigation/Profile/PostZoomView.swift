//
//  PostView.swift
//  Navigation
//
//  Created by insomnia on 18.03.2022.
//

import UIKit

class PostZoomView: UIView {
    
    private lazy var author: UILabel = {
        let author = UILabel()
        author.numberOfLines = 0
        author.font = .systemFont(ofSize: 20, weight: .bold)
        author.adjustsFontForContentSizeCategory = true
        author.minimumScaleFactor = 0.5
        author.textAlignment = .center
        author.translatesAutoresizingMaskIntoConstraints = false
        return author
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var descriptionV: UILabel = {
        let descriptionV = UILabel()
        descriptionV.font = .systemFont(ofSize: 12, weight: .light)
        descriptionV.numberOfLines = 10
        descriptionV.textAlignment = .center
        descriptionV.translatesAutoresizingMaskIntoConstraints = false
        return descriptionV
    }()
    
    private lazy var likes: UILabel = {
        let likes = UILabel()
        likes.translatesAutoresizingMaskIntoConstraints = false
        return likes
    }()
    
    lazy var views: UILabel = {
        let views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
        return views
    }()
    
    private lazy var exitButton: UIButton = {
        let exitButton = UIButton()
        exitButton.setTitle("X", for: .normal)
        exitButton.addTarget(self, action: #selector(exitPress), for: .touchUpInside)
        exitButton.backgroundColor = .gray
        exitButton.layer.cornerRadius = 10
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        return exitButton
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    @objc func exitPress() {

        UIView.animate(withDuration: 0.5) {
            self.alpha = 0
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTableView()
        self.backgroundColor = .white
        self.alpha = 0
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func set(post: PostView) {
        author.text = post.author
        image.image = post.imageName
        descriptionV.text = post.description
        likes.text = "\(post.price) ♡"
        views.text = "\(post.views) ▷"
    }
    
    private func configureTableView() {
        
        var constraints = [NSLayoutConstraint]()
        
        self.addSubview(exitButton)
        self.addSubview(author)
        self.addSubview(image)
        self.addSubview(descriptionV)
        self.addSubview(stackView)
        stackView.addArrangedSubview(likes)
        stackView.addArrangedSubview(views)
        
        constraints.append(exitButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10))
        constraints.append(exitButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30))
        constraints.append(exitButton.heightAnchor.constraint(equalToConstant: 30))
        constraints.append(exitButton.widthAnchor.constraint(equalToConstant: 30))
        
        constraints.append(author.topAnchor.constraint(equalTo: exitButton.bottomAnchor, constant: 10))
        constraints.append(author.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10))
        constraints.append(author.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10))
        constraints.append(author.bottomAnchor.constraint(equalTo: image.topAnchor, constant: -10))
        
        constraints.append(image.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10))
        constraints.append(image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10))
        constraints.append(image.heightAnchor.constraint(lessThanOrEqualToConstant: 350))
        
        constraints.append(descriptionV.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10))
        constraints.append(descriptionV.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10))
        constraints.append(descriptionV.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10))
        constraints.append(descriptionV.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -20))
        
        constraints.append(stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10))
        constraints.append(stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10))
        constraints.append(stackView.bottomAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20))
                
        NSLayoutConstraint.activate(constraints)
    }
}
