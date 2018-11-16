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
    
}
    extension UITextField {
        func setBottomBorder() {
            self.borderStyle = .none
            self.layer.backgroundColor = UIColor.white.cgColor
            
            self.layer.masksToBounds = false
            self.layer.shadowColor = UIColor.gray.cgColor
            self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
            self.layer.shadowOpacity = 0.5
            self.layer.shadowRadius = 0.0
        }
    }


