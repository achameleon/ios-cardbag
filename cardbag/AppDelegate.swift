//
//  AppDelegate.swift
//  cardbag
//
//  Created by Anton Skorodumov on 26.10.2018.
//  Copyright © 2018 E-Lite-Telecom. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
        ) -> Bool {
        window = UIWindow(frame:UIScreen.main.bounds)
        let viewController = CardsListViewController()
        let Navigation = UINavigationController(rootViewController: viewController)
        window?.rootViewController = Navigation
        window?.makeKeyAndVisible()
        return true
    }
    
}

