//
//  ProfileViewController.swift
//  Navigation
//
//  Created by insomnia on 11.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileView = ProfileHeaderView()
    let postView = PostZoomView()
    let avatarView = AvatarZoomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = false
        setupConstraints()
        let avatarTap = UITapGestureRecognizer(target: self, action: #selector(onTapScreen))
        profileView.avatarImage.addGestureRecognizer(avatarTap)
    }
    
    private lazy var tabelView: UITableView = {
        let tabelView = UITableView(frame: .zero, style: .grouped)
        tabelView.delegate = self
        tabelView.dataSource = self
        tabelView.layer.cornerRadius = 10
        tabelView.register(PostHeaderViewCell.self, forCellReuseIdentifier: Cells.postCell)
        tabelView.register(PhotosTableViewCell.self, forCellReuseIdentifier: Cells.photoCell)
        tabelView.register(MyLootsViewCell.self, forCellReuseIdentifier: Cells.labelCell)
        tabelView.register(LikesViewCell.self, forCellReuseIdentifier: Cells.likesCell)
        tabelView.translatesAutoresizingMaskIntoConstraints = false
        return tabelView
    }()
    
    @objc func onTapScreen() {
        
        UIView.animate(withDuration: 0.5) {
            self.avatarView.alpha = 0.95
        }
    }
    
    var posts: [PostView] = []
    var photos = PhotoView(photoName1: Photos.photo1!, photoName2: Photos.photo2!, photoName3: Photos.photo3!, photoName4: Photos.photo4!)
    var label = FavouritesView(favourites: "My Loots:")
    var likeLabel = myLikesView(myLikes: "My Likes:")
    
    struct Cells {
        static let postCell = "PostTableViewCell"
        static let photoCell = "PhotosTableViewCell"
        static let labelCell = "MyLootsViewCell"
        static let likesCell = "LikesViewCell"
    }
     
    private func setupConstraints() {
        
        posts = fetchData()
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        postView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(tabelView)
        view.addSubview(avatarView)
        view.addSubview(postView)
    
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(postView.topAnchor.constraint(equalTo: view.topAnchor))
        constraints.append(postView.rightAnchor.constraint(equalTo: view.rightAnchor))
        constraints.append(postView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(postView.leftAnchor.constraint(equalTo: view.leftAnchor))
        constraints.append(postView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        
        constraints.append(avatarView.topAnchor.constraint(equalTo: view.topAnchor))
        constraints.append(avatarView.rightAnchor.constraint(equalTo: view.rightAnchor))
        constraints.append(avatarView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        constraints.append(avatarView.leftAnchor.constraint(equalTo: view.leftAnchor))
        constraints.append(avatarView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        
        constraints.append(tabelView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(tabelView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(tabelView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(tabelView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
}

