//
//  LoginViewController.swift
//  CardBag
//
//  Created by Admin on 01.11.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import VKSdkFramework
class LoginViewController: UIViewController, VKSdkDelegate, VKSdkUIDelegate {
    let app_id = "6739379"
    let scope = ["email", "offlain"]
    let sdkInstance = VKSdk.initialize(withAppId: "6739379")

    @IBOutlet weak var b_phone: UIButton!
    @IBOutlet weak var b_facebook: UIButton!
    @IBOutlet weak var b_vk: UIButton!
    @IBOutlet weak var b_google: UIButton!
    @IBAction func b_vk_act(_ sender: Any) {
        loginVK()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    private func loginVK() {
        
        sdkInstance?.register(self)
        sdkInstance?.uiDelegate=self
        VKSdk.wakeUpSession(scope, complete: {
            (state: VKAuthorizationState, error: Error?) -> Void
            in if state == .authorized {
                print("authorized??")
            }
            else {
                print("need to auth")
                VKSdk.authorize(self.scope)
            }
            return
        })
    }
    func vkSdkAccessAuthorizationFinishedWithResult(result:VKAuthorizationResult?) -> Void {
    
    }
    
    func vkSdkUserAuthorizationFailed() -> Void {
        
    }
    
    func vkSdkAccessTokenUpdated(newToken:VKAccessToken?, oldToken:VKAccessToken?) -> Void {
        
    }
    
    
    func vkSdkShouldPresentViewController(controller:UIViewController?) -> Void {
        
    }
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        
    }
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
