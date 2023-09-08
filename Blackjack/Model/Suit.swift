//
//  Suits.swift
//  Blackjack
//
//  Created by Oliver Greiner-Petter on 8/24/23.
//

import SwiftUI

enum Suit: String, CaseIterable {
    case spade
    case club
    case heart
    case diamond
    
    var color: Color {
        switch self {
            case .spade, .club: return Color(.label)
            case .heart, .diamond: return .red
        }
    }
    var name: String {
        rawValue
    }
}
