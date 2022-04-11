//
//  MainTabBarViewController.swift
//  UINavigationNeto - Ivan
//
//  Created by Максим Клочков on 04.04.2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    let feedVC = FeedViewController()
    let profileVC = ProfileViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().barTintColor = .systemBlue
        UITabBar.appearance().backgroundColor = .white
        setupControllers()
    }

    private func setupControllers() {
        let feedNavigationController = UINavigationController(rootViewController: feedVC)
        feedVC.navigationItem.title = "Лента"
        feedVC.tabBarItem.title = "Лента"
        feedVC.tabBarItem.image = UIImage(systemName: "house")

        let profileNavigationController = UINavigationController(rootViewController: profileVC)
        profileVC.navigationItem.title = "Профиль"
        profileVC.tabBarItem.title = "Профиль"
        profileVC.tabBarItem.image = UIImage(systemName: "person.crop.circle")

        viewControllers = [feedNavigationController, profileNavigationController]
    }

}
