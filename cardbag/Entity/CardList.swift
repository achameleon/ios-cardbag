//
//  CardList.swift
//  cardbag
//
//  Created by User2 on 14.12.2018.
//  Copyright © 2018 E-Lite-Telecom. All rights reserved.
//

import Foundation

class CardRepository {
    
    var cardList: [Card] = []
    
    func addCard(card: Card) {
        cardList.append(card)
    }
    
    func getList() -> [Card] {
        return cardList
    }
}
