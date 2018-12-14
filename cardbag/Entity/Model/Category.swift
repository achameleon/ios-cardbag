//
//  Category.swift
//  CardBag
//
//  Created by User2 on 07.12.2018.
//  Copyright © 2018 arcMi. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class RCategoryItem: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(id: Int, title: String) {
        self.init()
        self.id = id
        self.title = title
    }
}
