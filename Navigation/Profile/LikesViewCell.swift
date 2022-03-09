//
//  LikesViewCell.swift
//  Navigation
//
//  Created by insomnia on 09.03.2022.
//

import UIKit

class LikesViewCell: UITableViewCell {
    
    private lazy var likes: UILabel = {
        let likes = UILabel()
        likes.font = .systemFont(ofSize: 25, weight: .light)
        likes.adjustsFontSizeToFitWidth = true
        likes.minimumScaleFactor = 0.5
        likes.translatesAutoresizingMaskIntoConstraints = false
        return likes
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLikes(myLikes: myLikesView) {
        likes.text = myLikes.myLikes
    }
    
    private func configureTableView() {
        
        addSubview(likes)
        
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(likes.topAnchor.constraint(equalTo: self.topAnchor))
        constraints.append(likes.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 125))
        constraints.append(likes.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5))
        constraints.append(likes.widthAnchor.constraint(equalToConstant: 250))
        constraints.append(likes.heightAnchor.constraint(equalToConstant: 30))

        NSLayoutConstraint.activate(constraints)
    }
}

struct myLikesView {
    let myLikes: String
}
