//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Максим Клочков on 06.04.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    lazy var button: UIButton = {
        let button = UIButton()
        //button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Кнопка", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()

//    override init() {
//        super.init()
//
//    }

    @objc private func didTapButton() {
        //
    }

}
