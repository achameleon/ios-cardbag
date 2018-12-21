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
import UIKit

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

extension RCardItem {
    func toCard() -> Card {
        let cardItem = Card()
        
        cardItem.id = id
        cardItem.title = title
        cardItem.discount = sale
        
        if let item = category {
            cardItem.category = CategoryList(id: item.id, title: item.title)
        }
        if let imgF = picFront, let imageDataFront = UIImage(data: imgF) {
            cardItem.front_photo = imageDataFront
        }
        if let imgR = picBack, let imageDataRear = UIImage(data: imgR) {
            cardItem.back_photo = imageDataRear
        }
        
        return cardItem
    }
}
