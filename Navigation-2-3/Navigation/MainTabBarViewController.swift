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
    let logInVC = LogInViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().barTintColor = ColorSet.mainColor
        UITabBar.appearance().backgroundColor = ColorSet.secondColor
        UITabBar.appearance().barTintColor = ColorSet.secondColor
        setupControllers()
    }

    private func setupControllers() {
        let feedNavigationController = UINavigationController(rootViewController: feedVC)
        feedVC.navigationItem.title = "Лента"
        feedVC.tabBarItem.title = "Лента"
        feedVC.tabBarItem.image = UIImage(systemName: "house")

        let profileNavigationController = UINavigationController(rootViewController: logInVC)
        logInVC.navigationItem.title = "Профиль"
        logInVC.tabBarItem.title = "Профиль"
        logInVC.tabBarItem.image = UIImage(systemName: "person.crop.circle")

        viewControllers = [feedNavigationController, profileNavigationController]
    }
}
