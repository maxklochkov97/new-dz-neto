//
//  SecondViewController.swift
//  UINavigationNeto - Ivan
//
//  Created by Максим Клочков on 04.04.2022.
//

import UIKit

import UIKit


class ProfileViewController: UIViewController {

    private lazy var profileHV: ProfileHeaderView = {
        let view = ProfileHeaderView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHV.avatarImageView.layer.cornerRadius = profileHV.avatarImageView.layer.frame.width / 2
    }

    private func setupView() {
        self.view.backgroundColor = .lightGray
        self.view.addSubview(self.profileHV)

        NSLayoutConstraint.activate([
            self.profileHV.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.profileHV.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.profileHV.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.profileHV.heightAnchor.constraint(equalToConstant: 220),
        ])
    }
}
