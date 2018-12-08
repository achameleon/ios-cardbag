//
//  CategoryList.swift
//  CardBag
//
//  Created by User2 on 30.11.2018.
//  Copyright © 2018 arcMi. All rights reserved.
//

import Foundation

struct CategoryList {
    
    var id = 0
    var title: String = ""
    let p = CategoriesViewController()
    
    init?(map: AnyObject?) {
        guard  let map = map as? [String: AnyObject] else {
            return
        }
        id = map["id"] as! Int
        title = map["title"] as! String
    }
    
    init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
    
}
