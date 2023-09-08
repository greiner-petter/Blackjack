//
//  BlackjackApp.swift
//  Blackjack
//
//  Created by Oliver Greiner-Petter on 8/24/23.
//

import SwiftUI

@main
struct BlackjackApp: App {
    @StateObject var game = Game()
    
    var body: some Scene {
        WindowGroup {
            ContentView(game: game)
        }
    }
}
