//
//  PhotosViewController.swift
//  Navigation
//
//  Created by insomnia on 09.03.2022.
//


import UIKit

class PhotosViewController: UIViewController {
    
    let photoZoomView = PhotoZoomView()
    
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
    
    var photos: [PhotosView] = []

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
        
        photos = fetchData()
        
        photoZoomView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self.collectionView)
        view.addSubview(photoZoomView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            photoZoomView.topAnchor.constraint(equalTo: view.topAnchor),
            photoZoomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            photoZoomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photoZoomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
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
