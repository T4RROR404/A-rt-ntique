//
//  FavouritesViewCell.swift
//  Navigation
//
//  Created by insomnia on 09.03.2022.
//

import UIKit

class MyLootsViewCell: UITableViewCell {
    
    private lazy var myLoots: UILabel = {
        let myLoots = UILabel()
        myLoots.font = .systemFont(ofSize: 20, weight: .light)
        myLoots.adjustsFontSizeToFitWidth = true
        myLoots.minimumScaleFactor = 0.5
        myLoots.translatesAutoresizingMaskIntoConstraints = false
        return myLoots
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setFav(favourites: FavouritesView) {
        myLoots.text = favourites.favourites
    }
    
    private func configureTableView() {
        
        addSubview(myLoots)
        
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(myLoots.topAnchor.constraint(equalTo: self.topAnchor, constant: 5))
        constraints.append(myLoots.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30))
        constraints.append(myLoots.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10))
        constraints.append(myLoots.widthAnchor.constraint(equalToConstant: 250))

        NSLayoutConstraint.activate(constraints)
    }
}

struct FavouritesView {
    let favourites: String
}
