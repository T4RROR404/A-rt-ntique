//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by insomnia on 13.02.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addConstraints()
        let tap = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        self.addGestureRecognizer(tap)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .lightGray
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .lightGray
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
    
    private lazy var tabelView: UITableView = {
        let tabelView = UITableView()
        tabelView.layer.cornerRadius = 10
        tabelView.translatesAutoresizingMaskIntoConstraints = false
        return tabelView
    }()
    
    private lazy var name: UILabel = {
        let name = UILabel()
        name.text = "K1LL B1LL"
        name.font = .systemFont(ofSize: 35, weight: .bold)
        name.adjustsFontSizeToFitWidth = true
        name.minimumScaleFactor = 0.5
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var favorites: UILabel = {
        let favorites = UILabel()
        favorites.text = "Favorites:"
        favorites.font = .systemFont(ofSize: 25, weight: .light)
        favorites.adjustsFontSizeToFitWidth = true
        favorites.minimumScaleFactor = 0.5
        favorites.translatesAutoresizingMaskIntoConstraints = false
        return favorites
    }()
    
    private lazy var status: UITextView = {
        let status = UITextView()
        status.backgroundColor = .systemGray2
        status.font = .systemFont(ofSize: 20)
        status.textColor = .systemGray
        status.text = "status"
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Waiting with something..."
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 0.5
        textField.returnKeyType = .done
        textField.autocapitalizationType = .words
        textField.font = .systemFont(ofSize: 15)
        textField.textColor = .systemGray2
        textField.backgroundColor = .systemGray4
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .next
        textField.keyboardType = .default
        textField.clearButtonMode = .always
        textField.alpha = 0
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    } ()
    
    private lazy var showButton: UIButton = {
        let showButton = UIButton()
        showButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        showButton.setTitle("Create Status", for: .normal)
        showButton.backgroundColor = .systemBlue
        showButton.layer.cornerRadius = 7
        showButton.layer.shadowColor = UIColor.black.cgColor
        showButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        showButton.layer.shadowRadius = 5
        showButton.layer.shadowOpacity = 0.3
        showButton.translatesAutoresizingMaskIntoConstraints = false
        return showButton
    }()
    
//    private lazy var newButton: UIButton = {
//        let newButton = UIButton()
//        newButton.setTitle("edit profile", for: .normal)
//        newButton.backgroundColor = .gray
//        newButton.layer.cornerRadius = 7
//        newButton.translatesAutoresizingMaskIntoConstraints = false
//        return newButton
//    }()

    let avatarImage: UIImageView = {
        let portrait = UIImage(named: "portrait")
        let avatarImage = UIImageView(image: portrait)
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        return avatarImage
    } ()

    @objc func buttonPressed() {
        status.text = textField.text
        status.textColor = .black
        textField.text = ""
        UIView.animate(withDuration: 1.0) {
            self.showButton.frame = CGRect(x: 205, y: 320, width: 160, height: 50)
            self.textField.alpha = 1
            self.endEditing(true)
            if self.status.hasText {
                self.showButton.setTitle("Change Status", for: .normal)
                self.textField.alpha = 0
                self.showButton.frame = CGRect(x: 205, y: 270, width: 160, height: 50)
            }
        }
    }
    
    @objc func tap(_ sender: Any) {
        textField.resignFirstResponder()
    }
    
    private lazy var labelStackView: UIStackView = {
        let labelstackView = UIStackView()
        labelstackView.axis = .vertical
        labelstackView.distribution = .fillEqually
        labelstackView.spacing = 20
        labelstackView.translatesAutoresizingMaskIntoConstraints = false
        return labelstackView
    }()
    
    private func setTableViewDelegate() {
        tabelView.delegate = self
        tabelView.dataSource = self
    
    }
    
    private func addFavoritesLoots(_ headLabel: String,_ image: UIImage,_ post: String) {
        let view = UIView()
        let headLabelinView = UILabel()
        let imageInView = UIImageView(image: image)
        let postInView = UILabel()
        
        view.addSubview(headLabelinView)
        view.addSubview(imageInView)
        view.addSubview(postInView)
        headLabelinView.text = headLabel
        postInView.text = post
    }
    

    private func addConstraints() {
        
        self.addSubview(labelStackView)
        self.addSubview(avatarImage)
        self.addSubview(textField)
        self.addSubview(showButton)
//        self.addSubview(newButton)
        self.addSubview(favorites)
        self.addSubview(scrollView)
        scrollView.addSubview(self.contentView)
        contentView.addSubview(self.stackView)
        labelStackView.addArrangedSubview(name)
        labelStackView.addArrangedSubview(status)
        
        
        for _ in 0..<4 {
            let view = UIView()
//            setTableViewDelegate()
//            view.backgroundColor = .systemGray4
            view.layer.cornerRadius = 10
            view.backgroundColor = .systemGray4
            self.stackView.addArrangedSubview(view)
            addFavoritesLoots("first", UIImage(named: "portrait")!, "text")
//            view.addSubview(pivoImage)
//            pivoImage.pin(to: view)

        }

        var constraints = [NSLayoutConstraint]()
        
        constraints.append(favorites.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 10))
        constraints.append(favorites.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor))
        constraints.append(favorites.widthAnchor.constraint(equalToConstant: 250))
        constraints.append(favorites.heightAnchor.constraint(equalToConstant: 60))
        
        constraints.append(avatarImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10))
        constraints.append(avatarImage.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 20))
        constraints.append(avatarImage.trailingAnchor.constraint(greaterThanOrEqualTo: self.trailingAnchor, constant: -240))
        constraints.append(avatarImage.bottomAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 430))
        
        constraints.append(labelStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50))
        constraints.append(labelStackView.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 30))
        constraints.append(labelStackView.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -20))
        constraints.append(labelStackView.bottomAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 450))
        
        constraints.append(textField.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 20))
        constraints.append(textField.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 30))
        constraints.append(textField.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -30))
        constraints.append(textField.bottomAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 350))
        
        constraints.append(showButton.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 20))
        constraints.append(showButton.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 30))
        constraints.append(showButton.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -20))
        constraints.append(showButton.bottomAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 350))
        constraints.append(showButton.heightAnchor.constraint(equalToConstant: 50))
        constraints.append(showButton.widthAnchor.constraint(equalToConstant: 160))
        
        constraints.append(self.scrollView.topAnchor.constraint(equalTo: self.topAnchor, constant: 420))
        constraints.append(self.scrollView.rightAnchor.constraint(equalTo: self.rightAnchor))
        constraints.append(self.scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor))
        constraints.append(self.scrollView.leftAnchor.constraint(equalTo: self.leftAnchor))
        constraints.append(self.scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor))

        constraints.append(self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor))
        constraints.append(self.contentView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor))
        constraints.append(self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor))
        constraints.append(self.contentView.widthAnchor.constraint(equalToConstant: 330))
        constraints.append(self.contentView.centerXAnchor.constraint(equalTo: self.centerXAnchor))

        constraints.append(self.stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor))
        constraints.append(self.stackView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor))
        constraints.append(self.stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor))
        constraints.append(self.stackView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor))
        constraints.append(self.stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor))
        
//        constraints.append(newButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 130))
//        constraints.append(newButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -130))
//        constraints.append(newButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor))

        NSLayoutConstraint.activate(constraints)
        
        for view in self.stackView.arrangedSubviews {
            
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: 230),
                view.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
            ])
        }
    }
}

extension ProfileHeaderView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

