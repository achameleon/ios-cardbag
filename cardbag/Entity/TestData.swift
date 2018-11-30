//
//  TestData.swift
//  CardBag
//
//  Created by User2 on 30.11.2018.
//  Copyright © 2018 arcMi. All rights reserved.
//

import Foundation

struct TestData {
    
    var id = 0
    var title: String = ""
    let p = CategoriesViewController()
    
    init (map: AnyObject) {
        id = map["id"] as! Int
        title = map["title"] as! String
    }
    
}
