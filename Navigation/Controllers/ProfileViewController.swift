//
//  ProfileViewController.swift
//  Navigation
//
//  Created by insomnia on 11.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileView = ProfileHeaderView()
    let postTableView = PostTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = false
        setupConstraints()
        let avatarTap = UITapGestureRecognizer(target: self, action: #selector(onTapScreen))
        profileView.avatarImage.addGestureRecognizer(avatarTap)
        
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
    
    lazy var avatarView: UIView = {
        let avatarView = UIView()
        avatarView.backgroundColor = .white
        avatarView.alpha = 0
        avatarView.isHidden = true
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        return avatarView
    }()
        
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var avatarImage: UIImageView = {
        let portrait = UIImage(named: "portrait")
        let avatarImage = UIImageView(image: portrait)
        avatarImage.layer.shadowColor = UIColor.black.cgColor
        avatarImage.layer.shadowOffset = CGSize(width: 10, height: 10)
        avatarImage.layer.shadowRadius = 10
        avatarImage.layer.shadowOpacity = 0.3
        avatarImage.isUserInteractionEnabled = true
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
            self.avatarView.isHidden = false
            self.avatarView.alpha = 0.9
        }
        
        avatarView.addSubview(exitButton)
        avatarView.addSubview(avatarImage)
        avatarView.addSubview(descriptionAvatar)
        
        
        var constraints = [NSLayoutConstraint] ()
        
        constraints.append(exitButton.topAnchor.constraint(equalTo: avatarView.topAnchor, constant: 60))
        constraints.append(exitButton.bottomAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: -580))
        constraints.append(exitButton.leadingAnchor.constraint(equalTo: avatarView.leadingAnchor, constant: 325))
        constraints.append(exitButton.trailingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: -30))
        
        constraints.append(avatarImage.topAnchor.constraint(equalTo: avatarView.topAnchor, constant: 100))
        constraints.append(avatarImage.bottomAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: -280))
        constraints.append(avatarImage.leadingAnchor.constraint(equalTo: avatarView.leadingAnchor, constant: 100))
        constraints.append(avatarImage.trailingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: -100))
        
        constraints.append(descriptionAvatar.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 20))
        constraints.append(descriptionAvatar.bottomAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: -10))
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
        
        view.addSubview(scrollView)
        view.addSubview(avatarView)
        view.addSubview(postTableView)
        scrollView.addSubview(self.contentView)
        contentView.addSubview(self.stackView)
        
        profileView.translatesAutoresizingMaskIntoConstraints = false
        postTableView.translatesAutoresizingMaskIntoConstraints = false
        
        posts = fetchData()
        let tabelView = UITableView()
        tabelView.delegate = self
        tabelView.dataSource = self
        tabelView.layer.cornerRadius = 10
        tabelView.sectionHeaderHeight = 250
        tabelView.estimatedRowHeight = 220
        tabelView.register(PostHeaderViewCell.self, forCellReuseIdentifier: Cells.postCell)
        tabelView.register(PhotosTableViewCell.self, forCellReuseIdentifier: Cells.photoCell)
        tabelView.register(MyLootsViewCell.self, forCellReuseIdentifier: Cells.labelCell)
        tabelView.register(LikesViewCell.self, forCellReuseIdentifier: Cells.likesCell)
        self.stackView.addArrangedSubview(tabelView)
    
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(postTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(postTableView.rightAnchor.constraint(equalTo: view.rightAnchor))
        constraints.append(postTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(postTableView.leftAnchor.constraint(equalTo: view.leftAnchor))
        constraints.append(postTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        
        constraints.append(avatarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(avatarView.rightAnchor.constraint(equalTo: view.rightAnchor))
        constraints.append(avatarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(avatarView.leftAnchor.constraint(equalTo: view.leftAnchor))
        constraints.append(avatarView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        
        constraints.append(scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(scrollView.rightAnchor.constraint(equalTo: view.rightAnchor))
        constraints.append(scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(scrollView.leftAnchor.constraint(equalTo: view.leftAnchor))
        constraints.append(scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor))

        constraints.append(contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor))
        constraints.append(contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor))
        constraints.append(contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor))
        constraints.append(contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor))

        constraints.append(self.stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor))
        constraints.append(self.stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor))
        constraints.append(self.stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor))
        constraints.append(self.stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor))
        constraints.append(self.stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor))
        
        NSLayoutConstraint.activate(constraints)
        
        
        for view in self.stackView.arrangedSubviews {
            
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: 680),
                view.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
            ])
        }
    }
}

