//
//  TableViewCell.swift
//  Navigation
//
//  Created by Максим Клочков on 21.04.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    private let photosArray = Photo.allPhotos()

    private let whiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var photoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .gray
        collection.dataSource = self
        collection.delegate = self
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        collection.register(PhotoHeaderCollectionView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: PhotoHeaderCollectionView.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCell() {
        [photoCollectionView, whiteView,].forEach({ contentView.addSubview($0) })

        let sideInset: CGFloat = 12

        NSLayoutConstraint.activate([
            whiteView.topAnchor.constraint(equalTo: contentView.topAnchor),
            whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            photoCollectionView.topAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: sideInset),
            photoCollectionView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: sideInset),
            photoCollectionView.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -sideInset),
            photoCollectionView.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -sideInset)
        ])
    }
}

// MARK: - UICollectionViewDataSource
extension PhotosTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.setupImage(photosArray[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {

    private var sideInset: CGFloat { return 8 }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - sideInset * 5) / 4
        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: PhotoHeaderCollectionView.identifier, for: indexPath) as! PhotoHeaderCollectionView
        header.backgroundColor = .red
        return header
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
