//
//  Ranks.swift
//  Blackjack
//
//  Created by Oliver Greiner-Petter on 8/24/23.
//

import Foundation

enum Rank: String, CaseIterable {
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case ten = "10"
    case jack = "J"
    case queen = "Q"
    case king = "K"
    case ace = "A"

    var value: Int {
        switch self {
            case .two: return 2
            case .three: return 3
            case .four: return 4
            case .five: return 5
            case .six: return 6
            case .seven: return 7
            case .eight: return 8
            case .nine: return 9
            case .ten, .jack, .queen, .king: return 10
            case .ace: return 11
        }
    }
    var name: String {
        rawValue
    }
}
