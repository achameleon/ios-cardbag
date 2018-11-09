//
//  CategoryItem.swift
//  cardbag
//
//  Created by Anton Skorodumov on 09/11/2018.
//  Copyright © 2018 E-Lite-Telecom. All rights reserved.
//

import Foundation

struct CategoryItem {
    
    var id: Int = 0
    var title: String = ""
 
    init?(map: AnyObject?) {
        guard let map = map as? [String: AnyObject] else { return }
        id = map["id"] as? Int ?? 0
        title = map["title"] as? String ?? ""
    }
    
}
