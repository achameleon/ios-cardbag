//
//  CardItem.swift
//  cardbag
//
//  Created by User2 on 14.12.2018.
//  Copyright © 2018 E-Lite-Telecom. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class RCardItem: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var sale: Int = 0
    @objc dynamic var category: RCategoryItem?
    @objc dynamic var picFront: Data?
    @objc dynamic var picBack: Data?
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(id: Int, title: String) {
        self.init()
        self.id = id
        self.title = title
    }
}
