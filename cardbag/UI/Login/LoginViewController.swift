//
//  LoginViewController.swift
//  CardBag
//
//  Created by Admin on 01.11.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import Alamofire

class LoginViewController: UIViewController, VKSdkDelegate, VKSdkUIDelegate {
    let app_id = "6378335"
    let scope = ["email", "offlain", "photos"]
    let secret_key = "LfcFkItvmzgmTXCD5leu"
    let sdkInstance = VKSdk.initialize(withAppId: "6378335")
    let api_url = "http://cardbag.ru/api"
    var vk_token: String = ""
    var uuid:String=""
    var access_token: String = ""
    var refresh_token: String = ""
    var photo_link : String = ""
    @IBOutlet weak var b_phone: UIButton!
    @IBOutlet weak var b_facebook: UIButton!
    @IBOutlet weak var b_vk: UIButton!
    @IBOutlet weak var b_google: UIButton!
    @IBAction func b_vk_act(_ sender: Any) {
        loginVK()
    }
    @IBAction func b_google_act(_ sender: Any) {
        loginGoogle()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        access_token = UserDefaults.standard.string(forKey: "accesstoken") ?? ""
        refresh_token = UserDefaults.standard.string(forKey: "refreshtoken") ?? ""
        let b_close = UIBarButtonItem(image: UIImage( named: "closeActive"), style: .plain, target: self, action: #selector(closeView))
        navigationItem.rightBarButtonItem = b_close
    }
    
    @objc func closeView() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    private func loginVK() {
        sdkInstance?.register(self)
        sdkInstance?.uiDelegate=self
        
        
        
        VKSdk.wakeUpSession(scope, complete: {
            (state: VKAuthorizationState, error: Error?) -> Void
            in if state == .authorized /*|| (self.access_token != "" && self.refresh_token != "")*/{
                
            }
            else {
                print("need to auth")
                VKSdk.authorize(self.scope)
            }
            return
        })
    }
    
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        if ((result?.token) != nil) {
            vk_token = (result?.token.accessToken)!
            print("user token: \(vk_token)")
            uuid=(result?.token.userId)!
            UserDefaults.standard.set(uuid, forKey: "userid")
            UserDefaults.standard.synchronize()
            getUserInfo(id: uuid, token: vk_token)
            userAccessToken(token: vk_token, network_id: 1)
        }
        else if ((result?.error) != nil) {
            let error_text = result?.error.debugDescription
            print("authorization failed with error: \(String(describing: error_text))")
        }
    }
    
    func getUserInfo(id:String, token:String) {
        let url = "https://api.vk.com/method/users.get"
        let parameters = [
            "access_token" : token,
            "user_id" : id,
            "fields" : "photo_200",
            "v" : "5.89"]
        Alamofire.request(url, method: .post, parameters: parameters, headers: [:]).responseJSON(completionHandler: {
            response in switch response.result {
            case .success(let JSON):
                print("Success with JSON: \(JSON)")
                
                let response = JSON as! [String:AnyObject]
                let data = (response["response"] as! [AnyObject]).first as! [String:AnyObject]
                let photo = data["photo_200"]!
                print(photo)
                UserDefaults.standard.set(photo, forKey: "photo")
                UserDefaults.standard.synchronize()
            case .failure(let error):
                print("Request failed with error: \(error)")
                
            }
            })
        
    }
    
    func getAccesToken() {
        let url = "https://oauth.vk.com/access_token"
        let parameters = [
            "client_id" : app_id,
            "client_secret" : secret_key,
            "grant_type" : "client_credentials",
            "v" : "5.92"]
        let headers = ["Authorization" : "Basic \(app_id)"]
        
        Alamofire.request(url, method: .post, parameters: parameters, headers: headers).responseJSON(completionHandler: {
            response in
            print(response.result)
            print(response.result.value as Any)
            })
    }
    
    func userAccessToken(token: String, network_id : Int) {
        let requestString = api_url + "/user/token"
        let parameters = [
            "uid": uuid,
            "token": token,
        "network_id": network_id] as [String: Any]
        Alamofire.request(requestString, method: .post, parameters: parameters, headers: [:]).responseJSON(completionHandler: {
            response
            in switch response.result {
            case .success(let JSON):
                print(self.uuid)
                print("Success with JSON: \(JSON)")
                
                let response = JSON as! [String:AnyObject]
                
                self.access_token = response["access_token"] as! String
                UserDefaults.standard.set(self.access_token, forKey: "accesstoken")
                self.refresh_token = response["refresh_token"] as! String
                UserDefaults.standard.set(self.refresh_token, forKey: "refreshtoken")
                self.uuid = response["uid"] as! String
                UserDefaults.standard.set((response["full_name"] as! String), forKey: "fullname")
                UserDefaults.standard.synchronize()
                self.userRefreshToken(token: self.refresh_token, network_id: network_id)
            case .failure(let error):
                print("Request failed with error: \(error)")
                
            }
            
            
        })
    }
    func userRefreshToken(token: String, network_id : Int) {
        let requestString = api_url + "/token/refresh"
        let parameters = [
            "network_id": network_id,
            "token": token,
            "uid": uuid
            ] as [String: Any]
       
        
        Alamofire.request(requestString, method: .post, parameters: parameters, headers: nil).responseJSON(completionHandler: {
            response
            in switch response.result {
            case .success(let JSON):
                print("Success with JSON: \(JSON)")
                
                let response = JSON as! [String:AnyObject]
                
                self.access_token = response["access_token"] as! String
                UserDefaults.standard.set(self.access_token, forKey: "accesstoken")
                self.refresh_token = response["refresh_token"] as! String
                UserDefaults.standard.set(self.refresh_token, forKey: "refreshtoken")
                //self.showAccount()
                UserDefaults.standard.set(network_id, forKey: "networkid")
                UserDefaults.standard.synchronize()
                self.navigationController?.dismiss(animated: true, completion: nil)
            case .failure(let error):
                print("Request failed with error: \(error)")
            }
            
        })
    }
    
    
    
    func showAccount() {
        let controller = ProfileViewController()
        navigationController?.present(controller, animated: true, completion: nil)
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
        guard let controller = controller
            else {
                return
        }
        present(controller, animated: true, completion: nil)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        
    }

}

extension LoginViewController : GIDSignInUIDelegate, GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        guard let controller = viewController
            else {
                return
        }
        present(controller, animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        guard let controller = viewController
            else {
                return
        }
        dismiss(animated: true, completion: nil)
    }
    
    private func loginGoogle() {
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
        
    }
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // ...
        if let error = error {
            print("error signing in with google \(error)")
            return
        }
        
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        access_token = user.authentication.accessToken!
        uuid = user.userID
        let url = user.profile.imageURL(withDimension: 200)
        UserDefaults.standard.set(url?.absoluteString, forKey: "photo")
        UserDefaults.standard.set(uuid, forKey: "userid")
        UserDefaults.standard.synchronize()
        userAccessToken(token: access_token, network_id: 2)
        
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }

}
