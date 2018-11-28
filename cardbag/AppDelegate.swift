//
//  AppDelegate.swift
//  cardbag
//
//  Created by Anton Skorodumov on 26.10.2018.
//  Copyright © 2018 E-Lite-Telecom. All rights reserved.
//

import UIKit
import VKSdkFramework
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        
        //let navigation = UINavigationController(rootViewController: OwnTableViewController())
        
        let navigationMy = UINavigationController(rootViewController: LoginViewController())
        
        window?.rootViewController = navigationMy
        
        window?.makeKeyAndVisible()
        
        return true
    }
    
    /*func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        VKSdk.processOpen(url, fromApplication: options.sou)
    }*/
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        VKSdk.processOpen(url, fromApplication: sourceApplication)
        return true
    }

}

