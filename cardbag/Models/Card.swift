//
//  Card.swift
//  cardbag
//
//  Created by Admin on 08.11.2018.
//  Copyright © 2018 E-Lite-Telecom. All rights reserved.
//

import Foundation
import UIKit

class Card
{
    var id: Int = 0
    var title: String = ""
    var category: CategoryList?
    var front_photo: UIImage? = nil
    var back_photo: UIImage? = nil
    var barcode_photo: String = ""
    var barcode: String = ""
    var deleted_at:String = ""
    var uuid:String = ""
    var discount: Int = 0
    var created_at: String = ""
    var updated_at: String = ""
    
    init () {}
    
    init ( a: Any)
    {
        guard let b = a as? [String:Any] else
        {
            return
        }
        id = b["id"] as? Int ?? 0
        title = b["title"] as? String ?? ""
        category = CategoryList(map: a as AnyObject)
        barcode_photo = b["barcode_photo"] as? String ?? ""
        barcode = b["barcode"] as? String ?? ""
        deleted_at = b["deleted_at"] as? String ?? ""
        uuid = b["uuid"] as? String ?? ""
        discount = b["discount"] as? Int ?? 0
        created_at = b["created_at"] as? String ?? ""
        updated_at = b["updated_at"] as? String ?? ""
    }
    
}

extension Card {
    func toRealm() -> RCardItem {
        
        let cardItem = RCardItem()
        
        cardItem.id = id
        cardItem.title = title
        cardItem.sale = discount
        
        if let item = category {
            cardItem.category = RCategoryItem(id: item.id, title: item.title)
        }
        if let imgF = front_photo,
            let imageDataFront = UIImagePNGRepresentation(imgF) {
            cardItem.picFront = imageDataFront
        }
        if let imgR = back_photo,
            let imageDataRear = UIImagePNGRepresentation(imgR) {
            cardItem.picBack = imageDataRear
        }
        
        return cardItem
    }
}
