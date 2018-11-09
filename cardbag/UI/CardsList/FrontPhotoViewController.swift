//
//  FrontPhotoViewController.swift
//  CardBag
//
//  Created by Admin on 24.10.2018.
//  Copyright © 2018 arcMi. All rights reserved.
//

import UIKit

class FrontPhotoViewController: UIViewController {
    
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnPhoto: UIButton!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var lblCategories: UILabel!
    @IBOutlet weak var lblSale: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnNext.setTitle("ДАЛЕЕ", for: .normal)
        lblCategories.layer.cornerRadius = 12
        lblSale.layer.cornerRadius = 12
        btnNext.layer.cornerRadius = 24
        
        lbl.text = "Лицевая сторона"
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Спортмастер"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onChangeBtn(_ sender: Any) {
        nextPage()
    }
    
    func nextPage() {
        let next = RearPhotoViewController()
        navigationController?.pushViewController(next, animated: true)
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
