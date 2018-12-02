//
//  Category.swift
//  cardbag
//
//  Created by Anton Skorodumov on 30/11/2018.
//  Copyright © 2018 E-Lite-Telecom. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class RCategoryItem: Object {
    
    dynamic var id: Int = 0
    dynamic var title: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(id: Int, title: String) {
        self.init()
        self.id = id
        self.title = title
    }
    
}
