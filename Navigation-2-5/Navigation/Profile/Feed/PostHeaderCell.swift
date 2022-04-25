//
//  PostHeaderCell.swift
//  Navigation
//
//  Created by Максим Клочков on 20.04.2022.
//

import UIKit

class CustomHeaderView: UIView {

    private let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .brown
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        backgroundColor = .black
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupHeader(text: String) {
        headerLabel.text = text
    }

    private func layout() {
        addSubview(headerLabel)
        let inset: CGFloat = 16

        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset)
        ])
    }

}
