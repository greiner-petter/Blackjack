//
//  HowToPlaySheet.swift
//  Blackjack
//
//  Created by Oliver Greiner-Petter on 8/24/23.
//

import SwiftUI

struct InfoSheet: View {
    @Binding var showingInfoSheet: Bool
    var body: some View {
        NavigationStack {
            List {
                Section(content: {
                    Text("The goal of blackjack is simple - to get as close as possible to 21 without going over, and to have a higher hand than the dealer. If the dealer goes over 21, they bust and lose the game. The same goes for you. A tie is won by the dealer.")
                }, header: {
                    Text("Basic rules")
                })
                Section(content: {
                    Text("Ask the dealer for another card. Do this when, based on the current value of your cards, either you're sure that the next card won’t cause you going bust, or you're willing to run the risk of the dealer getting a better hand.")
                }, header: {
                    Text("Hitting")
                })
                Section(content: {
                    Text("You do not want to recieve any more cards. You'll probably do this when the value of your cards are quite high already (e.g. over 17), and you're pretty sure the dealer's hand will not beat yours.")
                }, header: {
                    Text("Standing")
                })
                Section(content: {
                    Text("When the player is finished their actions, either decided to stand or busted, the dealer turns over his hidden card. The dealer now hits (takes more cards) or stands depending on the value of his hand. Contrary to the player, though, the dealer's action is completely dictated by the rules. The dealer must hit if the value of their hand is lower than 17, otherwise the dealer will stand. The dealer will hit a soft 17 (a hand of 17 containing an ace being counted as 11). When done hitting, the person with the higher hand wins!")
                }, header: {
                    Text("Showdown")
                })
            }
            .font(.system(size: 18, weight: .bold, design: .rounded))
            .navigationTitle("How to play")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Close", action: {
                        showingInfoSheet = false
                    })
                    .foregroundColor(Color(.label))
                }
            }
        }
    }
}

struct HowToPlaySheet_Previews: PreviewProvider {
    static var previews: some View {
        InfoSheet(showingInfoSheet: .constant(true))
    }
}
