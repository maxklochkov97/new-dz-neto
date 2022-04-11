//
//  SecondViewController.swift
//  UINavigationNeto - Ivan
//
//  Created by Максим Клочков on 04.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileHV = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(profileHV)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        profileHV.frame = view.safeAreaLayoutGuide.layoutFrame
    }
}
