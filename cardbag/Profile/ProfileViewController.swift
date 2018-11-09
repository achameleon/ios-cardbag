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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lb_cards.text = "Количество карт: \(cards) "
        // Do any additional setup after loading the view.
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
