//
//  Hand.swift
//  Blackjack
//
//  Created by Oliver Greiner-Petter on 8/24/23.
//

import Foundation

class Hand {
    var cards: [Card]
    var value: Int
    var lost: Bool
    var isDealer: Bool
    
    init(cards: [Card] = [], value: Int = 0, lost: Bool = false, isDealer: Bool = false) {
        self.cards = cards
        self.value = value
        self.lost = lost
        self.isDealer = isDealer
    }
}
