//
//  AddCardViewController.swift
//  CardBag
//
//  Created by Admin on 23.10.2018.
//  Copyright © 2018 arcMi. All rights reserved.
//

import UIKit

class AddCardViewController: UIViewController, UITextFieldDelegate {
    
    var category: CategoryList?
    
    @IBOutlet weak var btnPhoto: UIButton!
    @IBOutlet weak var cardName: UITextField!
    @IBOutlet weak var categories: UITextField!
    @IBOutlet weak var sale: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnPhoto.layer.cornerRadius = 24
        btnPhoto.setTitle("Сфотографировать", for: .normal)
        cardName.setBottomBorder()
        categories.setBottomBorder()
        sale.setBottomBorder()
        cardName.placeholder = "Название карты"
        categories.placeholder = "Категория"
        sale.placeholder = "Скидка"
        self.categories.delegate = self
        categories.addTarget(self, action: #selector(myTargetFunction), for: UIControl.Event.touchDown)
        navigationController?.navigationBar.isTranslucent = false
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onChangeBtn(_ sender: Any) {
        photoFrontPage()
    }
    @IBAction func onChangeCategories(_ sender: Any) {
        categoriesPage()
    }
    
    func photoFrontPage() {
        let nextPage = FrontPhotoViewController()
        nextPage.cardName = cardName.text ?? ""
        nextPage.sale = sale.text ?? ""
        nextPage.category = category
        navigationController?.pushViewController(nextPage, animated: true)
    }

    func categoriesPage() {
        let categoriesPage = CategoriesViewController()
        categoriesPage.delegate = self
        navigationController?.pushViewController(categoriesPage, animated: true)
    }
    
    @objc func myTargetFunction(textField: UITextField) {
        let categoriesPage = CategoriesViewController()
        categoriesPage.delegate = self
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

extension AddCardViewController: CategoriesChangeDelegate {
    
    func provideCategory(item: CategoryList) {
        categories.text = item.title
        category = item
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
