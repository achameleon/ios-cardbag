//
//  Category.swift
//  cardbag
//
//  Created by Admin on 08.11.2018.
//  Copyright © 2018 E-Lite-Telecom. All rights reserved.
//

import Foundation


class Category
{
    var id: Int = 0
    var title: String = ""
    init ( a:Any )
    {
        guard let b = a as? [String:Any] else
        {
            return 
        }
        
        id = b["id"] as? Int ?? 0
        title = b["title"] as? String ?? ""
    }
}
