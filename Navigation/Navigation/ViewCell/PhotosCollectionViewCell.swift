//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by ARAM on 24.06.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotosCollectionViewCell"
    
    private lazy var myImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
//    var gallery: [UIImage] {
//        var galeryPhoto = [UIImage]()
//        for i in 1...20 {
//         galeryPhoto.append(UIImage(named: "pic\(i)")!)
//        }
//        return galeryPhoto
//    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constraints1()
//        let images = ["pic1", "pic2", "pic3", "pic4", "pic5", "pic6","pic7", "pic8", "pic9", "pic10", "pic11", "pic12", "pic13", "pic14", "pic15", "pic16", "pic17", "pic18", "pic19", "pic20"]
        
//        let images = [
//        UIImage(named: "A"),
//        UIImage(named: "B"),
//        UIImage(named: "C"),
//        UIImage(named: "D")
//        ]
//        myImage.image = images.randomElement() as? UIImage
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with post: Photos) {
        myImage.image = UIImage(named: post.image)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func constraints1() {
        contentView.addSubview(myImage)
        
        NSLayoutConstraint.activate([
            myImage.topAnchor.constraint(equalTo: topAnchor),
            myImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            myImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            myImage.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
