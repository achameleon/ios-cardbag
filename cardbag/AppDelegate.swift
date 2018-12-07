//
//  AppDelegate.swift
//  cardbag
//
//  Created by Anton Skorodumov on 26.10.2018.
//  Copyright © 2018 E-Lite-Telecom. All rights reserved.
//

import UIKit
import VKSdkFramework
import Firebase
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate{
   

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)  
        
        let navigationMy = UINavigationController(rootViewController: LoginViewController())
        
        window?.rootViewController = navigationMy
        
        window?.makeKeyAndVisible()
        
        FirebaseApp.configure()
        
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        
        return true
    }

    func application(_ application: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any])
        -> Bool {
            VKSdk.processOpen(url, fromApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String)
            return GIDSignIn.sharedInstance().handle(url,
            sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String, annotation: [:])
    }
}

