//
//  StatsView.swift
//  Blackjack
//
//  Created by Oliver Greiner-Petter on 8/25/23.
//

import SwiftUI

struct StatsView: View {
    var gamesWon: Int
    var winstreak: Int
    
    var body: some View {
        VStack {
            Text("Winstreak: \(winstreak)")
            Text("Games Won: \(gamesWon)")
        }
        .font(.system(size: 20, weight: .bold, design: .rounded))
        .foregroundColor(.gray)
        .padding(.horizontal, 50)
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView(gamesWon: 0, winstreak: 0)
    }
}
