//
//  CardView.swift
//  Blackjack
//
//  Created by Oliver Greiner-Petter on 8/24/23.
//

import SwiftUI

struct CardView: View {
    var card: Card
    
    var body: some View {
        ZStack {
            if card.isHidden {
                Rectangle()
                    .cornerRadius(10)
                    .foregroundColor(Color(.label))
                Rectangle()
                    .cornerRadius(8)
                    .foregroundColor(Color(.systemBackground))
                    .padding(5)
                HStack {
                    VStack {
                        Image(systemName: "suit.spade")
                            .padding(.bottom, 10)
                        Image(systemName: "suit.club")
                    }
                    VStack {
                        Image(systemName: "suit.diamond")
                            .font(.system(size: 37, weight: .bold, design: .rounded))
                            .padding(.bottom, 9)
                        Image(systemName: "suit.heart")
                    }
                }
                .font(.system(size: 35, weight: .bold, design: .rounded))
            } else {
                Rectangle()
                    .cornerRadius(10)
                    .foregroundColor(card.suit.color)
                Rectangle()
                    .cornerRadius(8)
                    .foregroundColor(Color(.systemBackground))
                    .padding(5)
                HStack {
                    VStack {
                        Text(card.rank.name)
                        Image(systemName: "suit.\(card.suit.name).fill")
                        Spacer()
                    }
                    Spacer()
                    VStack {
                        Text(card.rank.name)
                        Image(systemName: "suit.\(card.suit.name).fill")
                        Spacer()
                    }
                    .rotationEffect(Angle(degrees: 180))
                }
                .padding(10)
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .foregroundColor(card.suit.color)
            }
        }
        .frame(width: 125, height: 175)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(suit: .club, rank: .ace, isHidden: false))
            .previewLayout(.sizeThatFits)
    }
}
