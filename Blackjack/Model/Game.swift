//
//  Game.swift
//  Blackjack
//
//  Created by Oliver Greiner-Petter on 8/24/23.
//

import Foundation

class Game: ObservableObject {
    @Published var deck: Deck = Deck()
    @Published var showingDealerValue: Bool = false
    @Published var player: Hand = Hand()
    @Published var dealer: Hand = Hand(isDealer: true)
    
    init() {
        resetGame()
    }
    
    func resetGame() {
        self.deck = Deck()
        self.showingDealerValue = false
        self.player = Hand()
        self.dealer = Hand(isDealer: true)
        
        for _ in 0...1 {
            let card = deck.cards.last!
            dealer.cards.append(card)
            dealer.value += card.rank.value
            deck.cards.removeLast()
        }
        dealer.cards[0].isHidden = false
    }
    func hit() {
        drawCard(hand: player)
        checkBust(hand: player)
    }
    func stand() {
        showingDealerValue = true
        dealer.cards[1].isHidden = false
        var dealerMustDraw = true
        while dealerMustDraw {
            while dealer.value < 17 {
                drawCard(hand: dealer)
                checkBust(hand: dealer)
            }
            if dealer.value == 17 {
                convertAce(hand: dealer)
            }
            if dealer.value > 16 {
                dealerMustDraw = false
            }
        }
        if dealer.value > 21 {
            dealer.lost = true
        } else if player.value > dealer.value {
            dealer.lost = true
        } else {
            player.lost = true
        }
    }
    func drawCard(hand: Hand) {
        var card = deck.cards.last!
        card.isHidden = false
        hand.cards.append(card)
        hand.value += card.rank.value
        deck.cards.removeLast()
    }
    func convertAce(hand: Hand) {
        for i in 0..<hand.cards.count {
            if hand.cards[i].rank == .ace && !hand.cards[i].isOne {
                hand.value -= 10
                hand.cards[i].isOne = true
                break
            }
        }
    }
    func checkBust(hand: Hand) {
        if hand.value > 21 {
            convertAce(hand: hand)
        }
        if hand.value > 21 {
            hand.lost = true
        }
    }
}
extension Game {
    static var sampleGame: Game {
        let game = Game()
        game.hit()
        game.hit()
        return game
    }
}
