//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by insomnia on 01.03.2022.
//

import UIKit

class PostHeaderViewCell: UITableViewCell {
    
    lazy var authorPost: UILabel = {
        let authorPost = UILabel()
        authorPost.numberOfLines = 0
        authorPost.font = .systemFont(ofSize: 20, weight: .bold)
        authorPost.adjustsFontForContentSizeCategory = true
        authorPost.minimumScaleFactor = 0.5
        authorPost.textAlignment = .center
        authorPost.translatesAutoresizingMaskIntoConstraints = false
        return authorPost
    }()
    
    lazy var imagePost: UIImageView = {
        let imagePost = UIImageView()
        imagePost.translatesAutoresizingMaskIntoConstraints = false
        return imagePost
    }()
    
    lazy var descriptionPost: UILabel = {
        let descriptionPost = UILabel()
        descriptionPost.font = .systemFont(ofSize: 12, weight: .light)
        descriptionPost.numberOfLines = 2
        descriptionPost.textAlignment = .center
        descriptionPost.translatesAutoresizingMaskIntoConstraints = false
        return descriptionPost
    }()
    
    lazy var likesPost: UILabel = {
        let likesPost = UILabel()
        likesPost.translatesAutoresizingMaskIntoConstraints = false
        return likesPost
    }()
    
    lazy var viewsPost: UILabel = {
        let viewsPost = UILabel()
        viewsPost.translatesAutoresizingMaskIntoConstraints = false
        return viewsPost
    }()
    
    lazy var labelStackView: UIStackView = {
        let labelStackView = UIStackView()
        labelStackView.axis = .horizontal
        labelStackView.spacing = 20
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        return labelStackView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(post: PostView) {
        authorPost.text = post.author
        imagePost.image = post.imageName
        descriptionPost.text = post.description
        likesPost.text = "\(post.price) ♡"
        viewsPost.text = "\(post.views) ▷"
    }
    
    private func configureTableView() {
        
        var constraints = [NSLayoutConstraint]()
        
        addSubview(stackView)
        stackView.addArrangedSubview(authorPost)
        stackView.addArrangedSubview(imagePost)
        stackView.addArrangedSubview(descriptionPost)
        stackView.addArrangedSubview(labelStackView)
        labelStackView.addArrangedSubview(likesPost)
        labelStackView.addArrangedSubview(viewsPost)
        
        constraints.append(stackView.centerXAnchor.constraint(equalTo: centerXAnchor))
        constraints.append(stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10))
        constraints.append(stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10))
        constraints.append(stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20))
        constraints.append(stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20))
        constraints.append(imagePost.heightAnchor.constraint(equalToConstant: 350))
        
        for views in stackView.arrangedSubviews {
            constraints.append(views.centerXAnchor.constraint(equalTo: stackView.centerXAnchor))
        }
                
        NSLayoutConstraint.activate(constraints)
    }
}

struct PostView {
    let author: String
    let description: String
    let imageName:UIImage
    var price: Int
    var views: Int
}

struct Images {
    static let cryptoPunk = UIImage(named: "cryptoPunk")
    static let verona = UIImage(named: "verona1909")
    static let watch = UIImage(named: "watch")
    static let portraitsGays = UIImage(named: "portraitsGays")
}
