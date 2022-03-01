//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by insomnia on 01.03.2022.
//

import UIKit

class ProfileHeaderViewCell: UITableViewCell {
    
    private lazy var authorPost: UILabel = {
        let authorPost = UILabel()
        authorPost.numberOfLines = 0
        authorPost.font = .systemFont(ofSize: 20, weight: .bold)
        authorPost.adjustsFontForContentSizeCategory = true
        authorPost.minimumScaleFactor = 0.5
        authorPost.translatesAutoresizingMaskIntoConstraints = false
        return authorPost
    }()
    
    private lazy var imagePost: UIImageView = {
        let imagePost = UIImageView()
        imagePost.translatesAutoresizingMaskIntoConstraints = false
        return imagePost
    }()
    
    private lazy var descriptionPost: UILabel = {
        let descriptionPost = UILabel()
        descriptionPost.font = .systemFont(ofSize: 12, weight: .light)
        descriptionPost.numberOfLines = 5
        descriptionPost.translatesAutoresizingMaskIntoConstraints = false
        return descriptionPost
    }()
    
    private lazy var likesPost: UILabel = {
        let likesPost = UILabel()
        likesPost.translatesAutoresizingMaskIntoConstraints = false
        return likesPost
    }()
    
    private lazy var viewsPost: UILabel = {
        let viewsPost = UILabel()
        viewsPost.translatesAutoresizingMaskIntoConstraints = false
        return viewsPost
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 40
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
        likesPost.text = "\(post.likes) Likes                               \(post.views) Views"
//        viewsPost.text = "\(post.views) Views"
        
    }
    
    private func configureTableView() {
        
        var constraints = [NSLayoutConstraint]()
        
        addSubview(stackView)
        stackView.addArrangedSubview(authorPost)
        stackView.addArrangedSubview(imagePost)
        stackView.addArrangedSubview(descriptionPost)
        stackView.addArrangedSubview(likesPost)
        stackView.addArrangedSubview(viewsPost)
        
        constraints.append(stackView.centerYAnchor.constraint(equalTo: centerYAnchor))
        constraints.append(stackView.centerXAnchor.constraint(equalTo: centerXAnchor))
        constraints.append(stackView.bottomAnchor.constraint(equalTo: bottomAnchor))
        constraints.append(stackView.leadingAnchor.constraint(equalTo: leadingAnchor))
        constraints.append(stackView.trailingAnchor.constraint(equalTo: trailingAnchor))
        constraints.append(imagePost.widthAnchor.constraint(equalToConstant: 300))
        constraints.append(imagePost.heightAnchor.constraint(equalToConstant: 300))
                
        NSLayoutConstraint.activate(constraints)
    }
}

struct PostView {
    let author: String
    let description: String
    let imageName:UIImage
    let likes: Int
    let views: Int
}

struct Images {
    static let cryptoPunk = UIImage(named: "cryptoPunk")
    static let verona = UIImage(named: "verona1909")
    static let watch = UIImage(named: "watch")
    static let portraitsGays = UIImage(named: "portraitsGays")
}
