//
//  Card.swift
//  cardbag
//
//  Created by Admin on 08.11.2018.
//  Copyright © 2018 E-Lite-Telecom. All rights reserved.
//

import Foundation


class Card
{
    var id: Int = 0
    var title: String = ""
    var category: CategoryList!
    var front_photo: String = ""
    var back_photo: String = ""
    var barcode_photo: String = ""
    var barcode: String = ""
    var deleted_at:String = ""
    var uuid:String = ""
    var discount: Int = 0
    var created_at: String = ""
    var updated_at: String = ""
    
    init ( a: Any)
    {
        guard let b = a as? [String:Any] else
        {
            return
        }
        id = b["id"] as? Int ?? 0
        title = b["title"] as? String ?? ""
        category = CategoryList(map: a as AnyObject)
        front_photo = b["front_photo"] as? String ?? ""
        back_photo = b["back_photo"] as? String ?? ""
        barcode_photo = b["barcode_photo"] as? String ?? ""
        barcode = b["barcode"] as? String ?? ""
        deleted_at = b["deleted_at"] as? String ?? ""
        uuid = b["uuid"] as? String ?? ""
        discount = b["discount"] as? Int ?? 0
        created_at = b["created_at"] as? String ?? ""
        updated_at = b["updated_at"] as? String ?? ""
    }
    
}

