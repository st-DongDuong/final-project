//
//  AppDelegate.swift
//  FinalProject
//
//  Created by Dong Duong V. on 7/15/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let onboad = OnboardingViewController()
        window?.rootViewController = UINavigationController(rootViewController: onboad)
        window?.makeKeyAndVisible()
        return true
    }
}
