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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = false
        setupConstraints()
        let avatarTap = UITapGestureRecognizer(target: self, action: #selector(onTapScreen))
        profileView.avatarImage.addGestureRecognizer(avatarTap)
    }
    
    lazy var avatarView: UIView = {
        let avatarView = UIView()
        avatarView.backgroundColor = .white
        avatarView.alpha = 0
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        return avatarView
    }()
    
    private lazy var avatarImage: UIImageView = {
        let portrait = UIImage(named: "portrait")
        let avatarImage = UIImageView(image: portrait)
        avatarImage.layer.shadowColor = UIColor.black.cgColor
        avatarImage.layer.shadowOffset = CGSize(width: 10, height: 10)
        avatarImage.layer.shadowRadius = 10
        avatarImage.layer.shadowOpacity = 0.3
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        return avatarImage
    } ()
    
    private lazy var exitButton: UIButton = {
        let exitButton = UIButton()
        exitButton.setTitle("X", for: .normal)
        exitButton.addTarget(self, action: #selector(exitPressed), for: .touchUpInside)
        exitButton.backgroundColor = .gray
        exitButton.layer.cornerRadius = 10
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        return exitButton
    }()
    
    @objc func exitPressed() {
        profileView.avatarImage.alpha = 1
        UIView.animate(withDuration: 0.5) {
            self.avatarView.alpha = 0
            
        }
    }
    
    private lazy var descriptionAvatar: UILabel = {
        let descriptionAvatar = UILabel()
        descriptionAvatar.font = .systemFont(ofSize: 12, weight: .light)
        descriptionAvatar.numberOfLines = 100
        descriptionAvatar.textAlignment = .center
        descriptionAvatar.text = "Bill Gates, in full William Henry Gates III, (born October 28, 1955, Seattle, Washington, U.S.), American computer programmer and entrepreneur who cofounded Microsoft Corporation, the world’s largest personal-computer software company.Gates wrote his first software program at the age of 13. In high school he helped form a group of programmers who computerized their school’s payroll system and founded Traf-O-Data, a company that sold traffic-counting systems to local governments. In 1975 Gates, then a sophomore at Harvard University, joined his hometown friend Paul G."
        descriptionAvatar.translatesAutoresizingMaskIntoConstraints = false
        return descriptionAvatar
    }()
    
    @objc func onTapScreen() {
        
        UIView.animate(withDuration: 0.5) {
            self.profileView.avatarImage.alpha = 0
            self.avatarView.alpha = 0.9
        }
        
        avatarView.addSubview(exitButton)
        avatarView.addSubview(avatarImage)
        avatarView.addSubview(descriptionAvatar)
        
        
        var constraints = [NSLayoutConstraint] ()
        
        constraints.append(exitButton.topAnchor.constraint(equalTo: avatarView.topAnchor, constant: 80))
        constraints.append(exitButton.trailingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: -30))
        constraints.append(exitButton.heightAnchor.constraint(equalToConstant: 30))
        constraints.append(exitButton.widthAnchor.constraint(equalToConstant: 30))
        
        constraints.append(avatarImage.topAnchor.constraint(equalTo: exitButton.bottomAnchor, constant: 30))
        constraints.append(avatarImage.leadingAnchor.constraint(lessThanOrEqualTo: avatarView.leadingAnchor, constant: 150))
        constraints.append(avatarImage.trailingAnchor.constraint(greaterThanOrEqualTo: avatarView.trailingAnchor, constant: -150))
        constraints.append(avatarImage.heightAnchor.constraint(lessThanOrEqualToConstant: 350))
        constraints.append(avatarImage.centerXAnchor.constraint(equalTo: avatarView.centerXAnchor))
        
        constraints.append(descriptionAvatar.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 20))
        constraints.append(descriptionAvatar.bottomAnchor.constraint(lessThanOrEqualTo: avatarView.safeAreaLayoutGuide.bottomAnchor, constant: -20))
        constraints.append(descriptionAvatar.leadingAnchor.constraint(equalTo: avatarView.leadingAnchor, constant: 30))
        constraints.append(descriptionAvatar.trailingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: -30))
        
        NSLayoutConstraint.activate(constraints)
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
        
        profileView.translatesAutoresizingMaskIntoConstraints = false
        postView.translatesAutoresizingMaskIntoConstraints = false
        
        posts = fetchData()
        let tabelView = UITableView()
        tabelView.delegate = self
        tabelView.dataSource = self
        tabelView.layer.cornerRadius = 10
        tabelView.sectionHeaderHeight = 250
        tabelView.estimatedRowHeight = 220
        tabelView.translatesAutoresizingMaskIntoConstraints = false
        tabelView.register(PostHeaderViewCell.self, forCellReuseIdentifier: Cells.postCell)
        tabelView.register(PhotosTableViewCell.self, forCellReuseIdentifier: Cells.photoCell)
        tabelView.register(MyLootsViewCell.self, forCellReuseIdentifier: Cells.labelCell)
        tabelView.register(LikesViewCell.self, forCellReuseIdentifier: Cells.likesCell)

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

