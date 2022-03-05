//
//  ProfileTableHederView.swift
//  Navigation
//
//  Created by insomnia on 03.03.2022.
//

import UIKit

class ProfileTableHederView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
    
    lazy var favorites: UILabel = {
        let favorites = UILabel()
        favorites.text = "My Loots:"
        favorites.font = .systemFont(ofSize: 20, weight: .light)
        favorites.adjustsFontSizeToFitWidth = true
        favorites.minimumScaleFactor = 0.5
        favorites.translatesAutoresizingMaskIntoConstraints = false
        return favorites
    }()
    
    lazy var profileView: UIView = {
        let profileView = ProfileHeaderView()
        profileView.translatesAutoresizingMaskIntoConstraints = false
        return profileView
    }()
    
    var posts: [PostView] = []
    struct Cells {
        static let postCell = "PostTableViewCell"
    }
        
    private func addConstraints() {

//        self.addSubview(favorites)
        self.addSubview(scrollView)
        scrollView.addSubview(self.contentView)
        contentView.addSubview(self.stackView)
        
        posts = fetchData()
        let tabelView = UITableView()
        tabelView.delegate = self
        tabelView.dataSource = self
        tabelView.layer.cornerRadius = 10
        tabelView.sectionHeaderHeight = 280
        tabelView.register(ProfileHeaderViewCell.self, forCellReuseIdentifier: Cells.postCell)
        self.stackView.addArrangedSubview(tabelView)
    
        var constraints = [NSLayoutConstraint]()
        
//        constraints.append(favorites.topAnchor.constraint(equalTo: self.topAnchor, constant: 70))
//        constraints.append(favorites.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30))
//        constraints.append(favorites.widthAnchor.constraint(equalToConstant: 250))
//        constraints.append(favorites.heightAnchor.constraint(equalToConstant: 50))
        
        constraints.append(self.scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10))
        constraints.append(self.scrollView.rightAnchor.constraint(equalTo: self.rightAnchor))
        constraints.append(self.scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10))
        constraints.append(self.scrollView.leftAnchor.constraint(equalTo: self.leftAnchor))
        constraints.append(self.scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor))

        constraints.append(self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor))
        constraints.append(self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor))
        constraints.append(self.contentView.trailingAnchor.constraint(equalTo: trailingAnchor))
        constraints.append(self.contentView.leadingAnchor.constraint(equalTo: leadingAnchor))

        constraints.append(self.stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor))
        constraints.append(self.stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30))
        constraints.append(self.stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor))
        constraints.append(self.stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -30))
        constraints.append(self.stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor))
        
        NSLayoutConstraint.activate(constraints)
        
        
        for view in self.stackView.arrangedSubviews {
            
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: 700),
                view.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
            ])
        }
    }
}
