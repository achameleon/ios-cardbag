//
//  AddCardsViewController.swift
//  CardBag
//
//  Created by Admin on 26.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class AddCardsViewController: UIViewController {

    public var nav: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Добавление карты"
        let ext = UIBarButtonItem(image: UIImage( named: "exit"), style: .plain, target: self, action: #selector(exit))
        navigationItem.leftBarButtonItem = ext
       // navigationItem.backBarButtonItem = ext

        // Do any additional setup after loading the view.
    }

    @objc func exit()
    {
        nav.dismiss(animated: false, completion: nil)
    }	

}
