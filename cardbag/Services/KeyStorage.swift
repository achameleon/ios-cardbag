//
//  KeyStorage.swift
//  cardbag
//
//  Created by Anton Skorodumov on 02/11/2018.
//  Copyright © 2018 E-Lite-Telecom. All rights reserved.
//

import Foundation

struct Keys {
    
    static let userIdKey: String = "userIdKey"
    static let titleKey: String = "titleKey"
    
}

class KeyStorage {
    
    var userDefault: UserDefaults = UserDefaults(suiteName: "info.site")!
    
    
    var userId: Int {
        get {
            return userDefault.integer(forKey: Keys.userIdKey)
        }
        set {
            userDefault.set(newValue, forKey: Keys.userIdKey)
            userDefault.synchronize()
        }
    }
    
    var title: String {
        get {
            return userDefault.string(forKey: Keys.titleKey) ?? ""
        }
        set {
            userDefault.set(newValue, forKey: Keys.titleKey)
            userDefault.synchronize()
        }
    }
    
}
