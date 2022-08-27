//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by ARAM on 22.06.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    private let photos = Photos.setupImages()
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    private lazy var photosLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var arrow: UIButton = {
        let arrow = UIButton()
        arrow.tintColor = .black
        arrow.translatesAutoresizingMaskIntoConstraints = false
        arrow.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        return arrow
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray6
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        let myImage = photos[indexPath.item]
        cell.setup(with: myImage)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cons: CGFloat = 8
        let items: CGFloat = 4
        let width: CGFloat = (UIScreen.main.bounds.width - (cons * 3))/items
        return CGSize(width: width , height: width - cons)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func constraints() {
        contentView.addSubview(collectionView)
        contentView.addSubview(photosLabel)
        contentView.addSubview(arrow)
        
        let constraint: CGFloat = 12
        let heightConst: CGFloat = 8
        let width: CGFloat = (UIScreen.main.bounds.width - ((constraint * 2) + heightConst * 3))/4
        NSLayoutConstraint.activate([
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            arrow.topAnchor.constraint(equalTo: photosLabel.topAnchor),
            arrow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            arrow.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            arrow.heightAnchor.constraint(equalTo: photosLabel.heightAnchor),
            arrow.widthAnchor.constraint(equalTo: arrow.heightAnchor),

            collectionView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            collectionView.leadingAnchor.constraint(equalTo: photosLabel.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -12),
            collectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12),
            collectionView.heightAnchor.constraint(equalToConstant: width)
        ])
    }
}

