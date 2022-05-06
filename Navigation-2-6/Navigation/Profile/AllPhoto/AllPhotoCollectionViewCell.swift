//
//  AllPhotoColl.swift
//  Navigation
//
//  Created by Максим Клочков on 25.04.2022.
//

import UIKit

class AllPhotoCollectionViewCell: UICollectionViewCell {

    private var photoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "catImage2"))
        imageView.frame = .zero
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
    }

    private func layout() {
        [photoImageView].forEach({ contentView.addSubview($0)})

        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
