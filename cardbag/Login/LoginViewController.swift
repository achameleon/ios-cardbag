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
    var uuid:String=""
    var vk_token : String = ""
    var vk_token_defaults=""
    @IBOutlet weak var lb_test: UILabel!
    @IBOutlet weak var b_phone: UIButton!
    @IBOutlet weak var b_facebook: UIButton!
    @IBOutlet weak var b_vk: UIButton!
    @IBOutlet weak var b_google: UIButton!
    @IBAction func b_vk_act(_ sender: Any) {
        loginVK()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        vk_token_defaults=UserDefaults.standard.string(forKey: "vktoken") ?? ""
        /*if vk_token_defaults != "" {
            print("vk token from defaults = \(vk_token_defaults)")
        }*/
        //getAccesToken()
        // Do any additional setup after loading the view.
    }
    private func loginVK() {
        
        sdkInstance?.register(self)
        sdkInstance?.uiDelegate=self
        VKSdk.wakeUpSession(scope, complete: {
            (state: VKAuthorizationState, error: Error?) -> Void
            in if state == .authorized /*|| self.vk_token_defaults != ""*/{
                print("authorized with vk token\(self.vk_token_defaults)")
                self.userAccessToken(token: self.vk_token_defaults)
            }
            else {
                print("need to auth")
                VKSdk.authorize(self.scope)
            }
            return
        })
    }
    func vkSdkAccessAuthorizationFinishedWithResult(result:VKAuthorizationResult?) -> Void {
        if ((result?.token) != nil) {
            vk_token = (result?.token.accessToken)!
            print("user token: \(vk_token)")
            uuid=(result?.token.userId)!
            userAccessToken(token: vk_token)
        }
        else if ((result?.error) != nil) {
            let error_text = result?.error.debugDescription
            print("authorization failed with error: \(String(describing: error_text))")
        }
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
        //self.uuid = NSUUID().uuidString
        let parameters = [
            "uid": uuid,
            "token": token,
            "network_id": "0"]
        //let headers = [:]
        Alamofire.request(requestString, method: .post, parameters: parameters, headers: [:]).responseJSON(completionHandler: {
            response in
            
            print(response.result)
            print("response result value: \(response.result.value as Any)")
            print("response data: \(response.data as Any)")
            print("response error: \(response.error as Any)")
            //print(response.result.error as Any)
            //print(response.result.value as Any)
            self.lb_test.text = response.result.value as? String
        })
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
