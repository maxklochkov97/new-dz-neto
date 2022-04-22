//
//  CollectionViewCell.swift
//  Navigation
//
//  Created by Максим Клочков on 22.04.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupImage(_ photo: Photo) {
        photoImageView.image = photo.image
    }

    private func setupCell() {
        contentView.addSubview(photoImageView)
        contentView.backgroundColor = .red
        contentView.layer.cornerRadius = 15

        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

}
