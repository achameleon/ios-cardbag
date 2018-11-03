//
//  CardAPI.swift
//  cardbag
//
//  Created by Anton Skorodumov on 02/11/2018.
//  Copyright © 2018 E-Lite-Telecom. All rights reserved.
//

import Foundation

enum CardAPI: String {
    
    case categoryList = "categoryList"
    case cardList = "cardList"
    
}

extension CardAPI {
    
    private var path: String {
        switch self {
        case .categoryList:
            return "/categories"
        case .cardList:
            return "/cards"
        }
    }
    
    var url: URL {
        return URL(string: Const.baseAPIURL + path)!
    }
    
}
