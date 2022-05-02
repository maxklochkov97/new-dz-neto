//
//  AppDelegate.swift
//  UINavigationNeto - Ivan
//
//  Created by Максим Клочков on 04.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainTabBarViewController()
        window?.makeKeyAndVisible()

        return true
    }
}

