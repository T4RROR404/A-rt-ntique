//
//  PhotosViewController.swift
//  Navigation
//
//  Created by insomnia on 09.03.2022.
//


import UIKit

class PhotosViewController: UIViewController {
    
    private enum Constants {
        static let itemCount: CGFloat = 3
    }
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCollectionCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    var collectionDataSource : [CollectionViewModel] = [
        CollectionViewModel(image: "photo1"),
        CollectionViewModel(image: "photo2"),
        CollectionViewModel(image: "photo3"),
        CollectionViewModel(image: "photo4"),
        CollectionViewModel(image: "photo5"),
        CollectionViewModel(image: "photo6"),
        CollectionViewModel(image: "photo7"),
        CollectionViewModel(image: "photo8"),
        CollectionViewModel(image: "photo9"),
        CollectionViewModel(image: "photo10"),
        CollectionViewModel(image: "photo11"),
        CollectionViewModel(image: "photo12"),
        CollectionViewModel(image: "photo13"),
        CollectionViewModel(image: "photo14"),
        CollectionViewModel(image: "photo15"),
        CollectionViewModel(image: "photo16"),
        CollectionViewModel(image: "photo17"),
        CollectionViewModel(image: "photo18"),
        CollectionViewModel(image: "photo19"),
        CollectionViewModel(image: "photo20")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.title = "Likes"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupView() {
        view.addSubview(self.collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func itemSize(for width: CGFloat, with spacing: CGFloat) -> CGSize {
        let neededWidth = width - 4 * spacing
        let itemWidth = floor(neededWidth / Constants.itemCount)
        return CGSize(width: itemWidth, height: itemWidth)
    }
}


struct CollectionViewModel {
    var image:String = ""

    init(image: String){
        self.image = image
    }
}
