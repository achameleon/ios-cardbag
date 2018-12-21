//
//  KeyStorage.swift
//  cardbag
//
//  Created by User2 on 21.12.2018.
//  Copyright © 2018 E-Lite-Telecom. All rights reserved.
//

import Foundation

struct Keys {
    
    static let idKey: String = "userIdKey"
    
}

class KeyStorage {
    
    var userDefault: UserDefaults = UserDefaults(suiteName: "cardLastId")!
    
    
    var userId: Int {
        get {
            return userDefault.integer(forKey: Keys.idKey)
        }
        set {
            userDefault.set(newValue, forKey: Keys.idKey)
            userDefault.synchronize()
        }
    }
    
}
