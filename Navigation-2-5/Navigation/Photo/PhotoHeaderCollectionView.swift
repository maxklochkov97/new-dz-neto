//
//  PhotoHeaderCollectionView.swift
//  Navigation
//
//  Created by Максим Клочков on 22.04.2022.
//

import UIKit

class PhotoHeaderCollectionView: UICollectionReusableView  {

    private let headlineLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 24)
        label.text = "Photos"
        return label
    }()

    private let photosButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "next"), for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        drawSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func drawSelf() {
        [headlineLabel, photosButton].forEach({ self.addSubview($0) })

        let sideInset: CGFloat = 12

        NSLayoutConstraint.activate([
            photosButton.heightAnchor.constraint(equalToConstant: 25),
            photosButton.widthAnchor.constraint(equalTo: photosButton.heightAnchor, multiplier: 1),
            photosButton.topAnchor.constraint(equalTo: self.topAnchor, constant: sideInset),
            photosButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -sideInset),

            headlineLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: sideInset),
            headlineLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: sideInset),
            headlineLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -sideInset),
        ])
    }

    @objc private func buttonPressed() {

    }
}
