//
//  CardAPI.swift
//  cardbag
//
//  Created by Admin on 02.11.2018.
//  Copyright © 2018 E-Lite-Telecom. All rights reserved.
//

import Foundation

enum CardAPI {
    case categoryList
}

extension CardAPI {
    var path : String {
        switch self {
        case .categoryList:
            return "/categories"
        }
    }
    
    var url : URL {
        return URL(string: Const.baseAPI + path)!
    }
}
