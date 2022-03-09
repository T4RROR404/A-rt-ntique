//
//  ProfileViewController.swift
//  Navigation
//
//  Created by insomnia on 11.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .white
        setupConstraints()
    }
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var profileView: UIView = {
        let profileView = ProfileHeaderView()
        profileView.translatesAutoresizingMaskIntoConstraints = false
        return profileView
    }()
    
    var posts: [PostView] = []
    var photos = PhotoView(photoName1: Photos.photo1!, photoName2: Photos.photo2!, photoName3: Photos.photo3!, photoName4: Photos.photo4!)
    var label = FavouritesView(favourites: "My Loots")
    var likeLabel = myLikesView(myLikes: "My Likes")
    
    struct Cells {
        static let postCell = "PostTableViewCell"
        static let photoCell = "PhotosTableViewCell"
        static let labelCell = "MyLootsViewCell"
        static let likesCell = "LikesViewCell"
    }
     
    private func setupConstraints() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(self.contentView)
        contentView.addSubview(self.stackView)
        
        posts = fetchData()
        let tabelView = UITableView()
        tabelView.delegate = self
        tabelView.dataSource = self
        tabelView.layer.cornerRadius = 10
        tabelView.sectionHeaderHeight = 250
        tabelView.estimatedRowHeight = 220
        tabelView.register(ProfileHeaderViewCell.self, forCellReuseIdentifier: Cells.postCell)
        tabelView.register(PhotosTableViewCell.self, forCellReuseIdentifier: Cells.photoCell)
        tabelView.register(MyLootsViewCell.self, forCellReuseIdentifier: Cells.labelCell)
        tabelView.register(LikesViewCell.self, forCellReuseIdentifier: Cells.likesCell)
        self.stackView.addArrangedSubview(tabelView)
    
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10))
        constraints.append(scrollView.rightAnchor.constraint(equalTo: view.rightAnchor))
        constraints.append(scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10))
        constraints.append(scrollView.leftAnchor.constraint(equalTo: view.leftAnchor))
        constraints.append(scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor))

        constraints.append(contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor))
        constraints.append(contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor))
        constraints.append(contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor))
        constraints.append(contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor))

        constraints.append(self.stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor))
        constraints.append(self.stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30))
        constraints.append(self.stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor))
        constraints.append(self.stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -30))
        constraints.append(self.stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor))
        
        NSLayoutConstraint.activate(constraints)
        
        
        for view in self.stackView.arrangedSubviews {
            
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: 700),
                view.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
            ])
        }
    }
}

