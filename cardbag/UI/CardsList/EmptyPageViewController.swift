//
//  EmptyPageViewController.swift
//  CardBag
//
//  Created by Admin on 17.10.2018.
//  Copyright © 2018 arcMi. All rights reserved.
//

import UIKit

class EmptyPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userButton = UIBarButtonItem(image: UIImage(named: "userActive"), style: .plain, target: self, action: #selector(addCard))
        let addButton = UIBarButtonItem(image: UIImage(named: "addActive"), style: .plain, target: self, action: #selector(addCard))
        
        navigationItem.title = "CARDbag"
        navigationItem.rightBarButtonItems = [addButton, userButton]

    }

    @objc private func addCard() {
        let addPage = AddCardViewController()
        let navigation = UINavigationController(rootViewController: addPage)
        let closeButton = UIBarButtonItem(image: UIImage(named: "closeActive"), style: .plain, target: self, action: #selector(close))
        
        addPage.navigationItem.title = "Добавить карту"
        addPage.navigationItem.leftBarButtonItem = closeButton
        navigationController?.present(navigation, animated: true, completion: nil)
    }
    
    @objc private func close() {
        dismiss(animated: true, completion: nil)
    }
    
}
