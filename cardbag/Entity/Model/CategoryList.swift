//
//  CategoryList.swift
//  cardbag
//
//  Created by Anton Skorodumov on 09/11/2018.
//  Copyright © 2018 E-Lite-Telecom. All rights reserved.
//

import Foundation

struct CategoryList {
    
    var categoryList: [CategoryItem] = []

    init?(map: AnyObject?) {
        guard let map = map as? [AnyObject] else { return }
        for mapItem in map  {
            guard let item = CategoryItem(map: mapItem) else { continue }
            categoryList.append(item)
        }
    }
    
}
