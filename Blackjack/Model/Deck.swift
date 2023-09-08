//
//  Deck.swift
//  Blackjack
//
//  Created by Oliver Greiner-Petter on 8/24/23.
//

import SwiftUI

struct Deck {
    var cards: [Card] = []
    
    init() {
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                cards.append(Card(suit: suit, rank: rank))
            }
        }
        cards.shuffle()
    }
}
