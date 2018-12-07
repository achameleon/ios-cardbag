//
//  LoginViewController.swift
//  CardBag
//
//  Created by Admin on 01.11.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    private var cards : Int = 5
    @IBOutlet weak var lb_Name: UILabel!
    @IBOutlet weak var lb_cards: UILabel!
    @IBOutlet weak var lb_sync: UILabel!
    @IBOutlet weak var lb_id: UILabel!
    @IBOutlet weak var b_exit: UIButton!
    @IBOutlet weak var img_vk: UIImageView!
    @IBAction func b_exit_onclick(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "accesstoken")
        UserDefaults.standard.removeObject(forKey: "refreshtoken")
        UserDefaults.standard.removeObject(forKey: "fullname")
        UserDefaults.standard.removeObject(forKey: "vkid")
        UserDefaults.standard.removeObject(forKey: "photo")
        let controller = LoginViewController()
        navigationController?.pushViewController(controller, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        lb_cards.text = "Количество карт: \(cards) "
        lb_Name.text = UserDefaults.standard.string(forKey: "fullname") ?? "Иван Иванов"
        lb_id.text = "vk.com/id\(UserDefaults.standard.string(forKey: "vkid") ?? "000")"
        b_exit.layer.cornerRadius=20
        b_exit.layer.masksToBounds = true
        
        if UserDefaults.standard.string(forKey: "photo") != "" {
            let pictureURL = URL(string: UserDefaults.standard.string(forKey: "photo") ?? "https://pp.userapi.com/c841037/v841037296/59fea/aHoCw_zkqTs.jpg?ava=1")!
            
            let session = URLSession(configuration: .default)
            
            let downloadPicTask = session.dataTask(with: pictureURL) { (data, response, error) in
                
                if let e = error {
                    print("Error downloading cat picture: \(e)")
                } else {
                    if let imageData = data {
                        
                        let image = UIImage(data: imageData)
                        self.img_vk.image=image
                    }
                }
            }
            downloadPicTask.resume()
        }
        
    }


}
