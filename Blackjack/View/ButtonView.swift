//
//  ButtonView.swift
//  Blackjack
//
//  Created by Oliver Greiner-Petter on 8/25/23.
//

import SwiftUI

struct ButtonView: View {
    @StateObject var game: Game
    
    var body: some View {
        HStack {
            Button(action: {
                game.hit()
            }, label: {
                ZStack {
                    Capsule()
                        .frame(width: 150, height: 50)
                        .foregroundColor(.green)
                    Label("Hit", systemImage: "checkmark")
                }
            })
            .padding([.horizontal, .bottom])
            Button(action: {
                game.stand()
            }, label: {
                ZStack {
                    Capsule()
                        .frame(width: 150, height: 50)
                        .foregroundColor(.red)
                        .opacity(0.8)
                    Label("Stand", systemImage: "xmark")
                }
            })
            .padding([.horizontal, .bottom])
        }
        .foregroundColor(.white)
        .font(.system(size: 24, weight: .bold, design: .rounded))
        .disabled(game.player.lost || game.dealer.lost)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(game: Game.sampleGame)
    }
}
