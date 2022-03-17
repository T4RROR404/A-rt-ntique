//
//  PostView.swift
//  Navigation
//
//  Created by insomnia on 18.03.2022.
//

import UIKit

class PostTableView: UIView {
    
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
    
    private lazy var views: UILabel = {
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
        stackView.alignment = .leading
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    @objc func exitPress() {

        UIView.animate(withDuration: 1) {
            self.alpha = 0
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTableView()
        self.backgroundColor = .white
        self.isHidden = true
        self.alpha = 0
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func set(post: PostView) {
        author.text = post.author
        image.image = post.imageName
        descriptionV.text = post.description
        likes.text = "\(post.views) Views                                           \(post.price) $"
//        viewsPost.text = "\(post.views) Views"
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
        constraints.append(exitButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 325))
        constraints.append(exitButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30))
        constraints.append(exitButton.bottomAnchor.constraint(equalTo: author.topAnchor, constant: -20))
        
        constraints.append(author.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10))
        constraints.append(author.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10))
        constraints.append(author.bottomAnchor.constraint(equalTo: image.topAnchor, constant: -30))
        
        constraints.append(image.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10))
        constraints.append(image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10))
        constraints.append(image.heightAnchor.constraint(equalToConstant: 350))
        
        constraints.append(descriptionV.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10))
        constraints.append(descriptionV.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10))
        constraints.append(descriptionV.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10))
        constraints.append(descriptionV.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -20))
        
        constraints.append(stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10))
        constraints.append(stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10))
        constraints.append(stackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 20))
                
        NSLayoutConstraint.activate(constraints)
    }
}
