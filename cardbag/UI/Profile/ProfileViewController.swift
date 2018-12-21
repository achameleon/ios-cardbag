//
//  LoginViewController.swift
//  CardBag
//
//  Created by Admin on 01.11.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Kingfisher

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
        UserDefaults.standard.removeObject(forKey: "userid")
        UserDefaults.standard.removeObject(forKey: "photo")
        UserDefaults.standard.removeObject(forKey: "networkid")
        UserDefaults.standard.synchronize()
        navigationController?.dismiss(animated: true, completion: nil)
        //let controller = LoginViewController()
        //navigationController?.pushViewController(controller, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        lb_cards.text = "Количество карт: \(cards) "
        lb_Name.text = UserDefaults.standard.string(forKey: "fullname") ?? "Иван Иванов"
        var soc_link = ""
        if(UserDefaults.standard.string(forKey: "networkid")=="1")
        {
            soc_link = "vk.com/id"
        }
        else
        {
            soc_link = "google+ id: "
        }
        lb_id.text = "\(soc_link) \(UserDefaults.standard.string(forKey: "userid") ?? "000")"
        b_exit.layer.cornerRadius=20
        b_exit.layer.masksToBounds = true
        
        
        let pictureUrl = URL(string: UserDefaults.standard.string(forKey: "photo") ?? "https://pp.userapi.com/c841037/v841037296/59fea/aHoCw_zkqTs.jpg?ava=1")!
        img_vk.kf.setImage(with: pictureUrl)
        let b_close = UIBarButtonItem(image: UIImage( named: "closeActive"), style: .plain, target: self, action: #selector(closeView))
        navigationItem.rightBarButtonItem = b_close
        
        img_vk.layer.cornerRadius = img_vk.frame.height/2
        img_vk.layer.masksToBounds = true
    }
    
    @objc func closeView() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}
