//
//  PhotoCollectionViewCell.swift
//  Navigation
//
//  Created by insomnia on 10.03.2022.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PhotoCollectionViewCell"
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.maskedCorners = [
            .layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner
        ]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
  
    lazy var photoGalleryImages: UIImageView = {
        let photoGalleryImages = UIImageView()
        photoGalleryImages.clipsToBounds = true
        photoGalleryImages.translatesAutoresizingMaskIntoConstraints = false
        return photoGalleryImages
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(photoGalleryImages)
        NSLayoutConstraint.activate([
            photoGalleryImages.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            photoGalleryImages.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            photoGalleryImages.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
            photoGalleryImages.widthAnchor.constraint(equalTo: self.contentView.widthAnchor)
        ])
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct PhotosView {

    let imageName:UIImage
}

struct PhotosCollection {
    static let photo1 = UIImage(named: "photo1")
    static let photo2 = UIImage(named: "photo2")
    static let photo3 = UIImage(named: "photo3")
    static let photo4 = UIImage(named: "photo4")
    static let photo5 = UIImage(named: "photo5")
    static let photo6 = UIImage(named: "photo6")
    static let photo7 = UIImage(named: "photo7")
    static let photo8 = UIImage(named: "photo8")
    static let photo9 = UIImage(named: "photo9")
    static let photo10 = UIImage(named: "photo10")
    static let photo11 = UIImage(named: "photo11")
    static let photo12 = UIImage(named: "photo12")
    static let photo13 = UIImage(named: "photo13")
    static let photo14 = UIImage(named: "photo14")
    static let photo15 = UIImage(named: "photo15")
    static let photo16 = UIImage(named: "photo16")
    static let photo17 = UIImage(named: "photo17")
    static let photo18 = UIImage(named: "photo18")
    static let photo19 = UIImage(named: "photo19")
    static let photo20 = UIImage(named: "photo20")
}

