//
//  CardList.swift
//  cardbag
//
//  Created by User2 on 14.12.2018.
//  Copyright © 2018 E-Lite-Telecom. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class CardRepository {
    
    var cardList: [Card] = []
    
    init() {
        let realm = try! Realm()
        
        let result = realm.objects(RCardItem.self)
        for t in result {
            cardList.append(t.toCard())
        }
        
    }
    
    func addCard(card: Card) {
        cardList.append(card)
    }
    
    func getList() -> [Card] {
        return cardList
    }
}
