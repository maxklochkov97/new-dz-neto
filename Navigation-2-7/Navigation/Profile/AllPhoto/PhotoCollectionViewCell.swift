//
//  CollectionViewCell.swift
//  Navigation
//
//  Created by Максим Клочков on 22.04.2022.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    weak var delegate: ButtonCellDelegate?

    private var photoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "catImage2"))
        imageView.frame = .zero
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let allPhotoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with photo: Photo) {
        self.photoImageView.image = UIImage(named: photo.imageName)
        photoImageView.layer.cornerRadius = 6
    }

    private func layout() {
        [photoImageView, allPhotoButton].forEach({ contentView.addSubview($0)})

        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            allPhotoButton.topAnchor.constraint(equalTo: photoImageView.topAnchor),
            allPhotoButton.leadingAnchor.constraint(equalTo: photoImageView.leadingAnchor),
            allPhotoButton.trailingAnchor.constraint(equalTo: photoImageView.trailingAnchor),
            allPhotoButton.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor),
        ])
    }
}
