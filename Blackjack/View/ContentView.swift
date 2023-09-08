//
//  ContentView.swift
//  Blackjack
//
//  Created by Oliver Greiner-Petter on 8/24/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("gamesWon") var gamesWon = 0
    @AppStorage("winstreak") var winstreak = 0
    @StateObject var game: Game
    @State private var showingInfoSheet: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                HeaderView(showingInfoSheet: $showingInfoSheet)
                HandView(game: game)
                Spacer()
                StatsView(gamesWon: gamesWon, winstreak: winstreak)
                ButtonView(game: game)
                .sheet(isPresented: $showingInfoSheet) {
                    InfoSheet(showingInfoSheet: $showingInfoSheet)
                }
            }
            if game.player.lost {
                LoserView(game: game)
                    .onAppear() {
                        winstreak = 0
                    }
            } else if game.dealer.lost {
                WinnerView(game: game)
                    .onAppear() {
                        gamesWon += 1
                        winstreak += 1
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(game: Game.sampleGame)
//            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
//            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
    }
}
