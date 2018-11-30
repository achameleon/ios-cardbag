//
//  LoginViewController.swift
//  CardBag
//
//  Created by Admin on 01.11.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import VKSdkFramework
import Alamofire
class LoginViewController: UIViewController, VKSdkDelegate, VKSdkUIDelegate {
    let app_id = "6378335"
    let scope = ["email", "offlain"]
    let secret_key = "LfcFkItvmzgmTXCD5leu"
    let sdkInstance = VKSdk.initialize(withAppId: "6378335")
    let api_url = "http://cardbag.ru/api"
    var vk_token: String = ""
    var uuid:String=""
    var access_token: String = ""
    var refresh_token: String = ""
    @IBOutlet weak var b_phone: UIButton!
    @IBOutlet weak var b_facebook: UIButton!
    @IBOutlet weak var b_vk: UIButton!
    @IBOutlet weak var b_google: UIButton!
    @IBAction func b_vk_act(_ sender: Any) {
        loginVK()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        access_token = UserDefaults.standard.string(forKey: "accesstoken") ?? ""
        refresh_token = UserDefaults.standard.string(forKey: "refreshtoken") ?? ""
    }
    
    private func loginVK() {
        
        sdkInstance?.register(self)
        sdkInstance?.uiDelegate=self
        VKSdk.wakeUpSession(scope, complete: {
            (state: VKAuthorizationState, error: Error?) -> Void
            in if state == .authorized || (self.access_token != "" && self.refresh_token != ""){
                
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
            UserDefaults.standard.set(vk_token, forKey: "vktoken")
            uuid=(result?.token.userId)!
            userAccessToken(token: vk_token)
        }
        else if ((result?.error) != nil) {
            let error_text = result?.error.debugDescription
            print("authorization failed with error: \(String(describing: error_text))")
        }
    }
    
    
    func getAccesToken() {
        let url = "https://oauth.vk.com/access_token"
        let parameters = [
            "client_id" : app_id,
            "client_secret" : secret_key,
            "grant_type" : "client_credentials",
            "v" : "5.87"]
        let headers = ["Authorization" : "Basic \(app_id)"]
        
        Alamofire.request(url, method: .post, parameters: parameters, headers: headers).responseJSON(completionHandler: {
            response in
            print(response.result)
            print(response.result.value as Any)
            })
    }
    
    func userAccessToken(token: String) {
        let requestString = api_url + "/user/token"
        let parameters = [
            "uid": uuid,
            "token": token,
        "network_id": 1] as [String: Any]
        Alamofire.request(requestString, method: .post, parameters: parameters, headers: [:]).responseJSON(completionHandler: {
            response
            in switch response.result {
            case .success(let JSON):
                print("Success with JSON: \(JSON)")
                
                let response = JSON as! [String:AnyObject]
                
                self.access_token = response["access_token"] as! String
                UserDefaults.standard.set(self.access_token, forKey: "accesstoken")
                self.refresh_token = response["refresh_token"] as! String
                UserDefaults.standard.set(self.refresh_token, forKey: "refreshtoken")
                self.uuid = response["uid"] as! String
                self.userRefreshToken(token: self.refresh_token)
            case .failure(let error):
                print("Request failed with error: \(error)")
                
            }
            
            
        })
    }
    func userRefreshToken(token: String) {
        let requestString = api_url + "/token/refresh"
        let parameters = [
            "network_id": 1,
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
              
            case .failure(let error):
                print("Request failed with error: \(error)")
            }
            
            
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
        guard let controller = controller
            else {
                return
        }
        present(controller, animated: true, completion: nil)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        
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
