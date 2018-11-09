//
//  AddCardViewController.swift
//  CardBag
//
//  Created by Admin on 23.10.2018.
//  Copyright © 2018 arcMi. All rights reserved.
//

import UIKit

class AddCardViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var btnPhoto: UIButton!
    @IBOutlet weak var sale: UITextField!
    @IBOutlet weak var categories: UITextField!
    @IBOutlet weak var cardName: UITextField!
   
    
   override func viewDidLoad() {
        super.viewDidLoad()
    
        btnPhoto.setTitle("Сфотографировать", for: .normal)
    cardName.setBottomBorder()
    sale.setBottomBorder()
    categories.setBottomBorder()
    cardName.placeholder = "Название карты"
    categories.placeholder = "Категория"
    sale.placeholder = "Скидка"
    self.categories.delegate = self
    categories.addTarget(self, action: #selector(myTargetFunction), for: UIControl.Event.touchDown)
    navigationController?.navigationBar.isTranslucent = false
    }
    
    @IBAction func onChangeBtn(_ sender: Any) {
        photoFrontPage()
    }
    @IBAction func onChangeCategories(_ sender: Any) {
        categoriesPage()
    }
    
    func photoFrontPage() {
        let nextPage = FrontPhotoViewController()
        navigationController?.pushViewController(nextPage, animated: true)
    }

    func categoriesPage() {
        let categoriesPage = CategoriesViewController()
        navigationController?.pushViewController(categoriesPage, animated: true)
    }

    @objc func myTargetFunction(textField: UITextField){
        let categoriesPage = CategoriesViewController()
        navigationController?.pushViewController(categoriesPage, animated: true)
        
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
