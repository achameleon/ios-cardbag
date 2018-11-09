//
//  RearPhotoViewController.swift
//  CardBag
//
//  Created by Admin on 24.10.2018.
//  Copyright © 2018 arcMi. All rights reserved.
//

import UIKit

class RearPhotoViewController: UIViewController {
    
    @IBOutlet var lbl: UILabel!
    @IBOutlet var btnSave: UIButton!
    @IBOutlet weak var lblCategories: UILabel!
    @IBOutlet weak var lblSale: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSave.layer.cornerRadius = 24
        btnSave.setTitle("СОХРАНИТЬ КАРТУ", for: .normal)
        lblCategories.layer.cornerRadius = 12
        lblSale.layer.cornerRadius = 12
        lbl.text = "Тыльная сторона"
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Спортмастер"        // Do any additional setup after loading the view.
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
