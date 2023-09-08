//
//  Card.swift
//  Blackjack
//
//  Created by Oliver Greiner-Petter on 8/24/23.
//

import SwiftUI

struct Card: Identifiable {
    let id: UUID
    let suit: Suit
    let rank: Rank
    var isHidden: Bool
    var isOne: Bool
    
    init(id: UUID = UUID(), suit: Suit, rank: Rank, isHidden: Bool = true, isOne: Bool = false) {
        self.id = id
        self.suit = suit
        self.rank = rank
        self.isHidden = isHidden
        self.isOne = isOne
    }
}
