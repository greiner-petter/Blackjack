//
//  HandView.swift
//  Blackjack
//
//  Created by Oliver Greiner-Petter on 8/25/23.
//

import SwiftUI

struct HandView: View {
    @StateObject var game: Game
    private var dealerValueMessage: String {
        if game.showingDealerValue {
            return "Hand Value: \(game.dealer.value)"
        }
        return "Hand Value: ?"
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("Dealer Hand:")
                    Spacer()
                    Text(dealerValueMessage)
                }
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(.gray)
                ZStack {
                    ForEach(0..<game.dealer.cards.count, id: \.self) { index in
                        CardView(card: game.dealer.cards[index])
                            .offset(x: CGFloat(index * 50))
                    }
                }
            }
            .padding(.bottom, 10)
            VStack(alignment: .leading) {
                HStack {
                    Text("Your Hand:")
                    Spacer()
                    Text("Hand Value: \(game.player.value)")
                }
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(.gray)
                ZStack {
                    ForEach(0..<game.player.cards.count, id: \.self) { index in
                        let card = game.player.cards[index]
                        CardView(card: card)
                            .offset(x: CGFloat(index * 50))
                    }
                }
            }
        }
        .padding(.horizontal, 25)
    }
}

struct HandView_Previews: PreviewProvider {
    static var previews: some View {
        HandView(game: Game.sampleGame)
    }
}
