//
//  GameOverView.swift
//  Blackjack
//
//  Created by Oliver Greiner-Petter on 8/24/23.
//

import SwiftUI

struct LoserView: View {
    @StateObject var game: Game
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(Color(.label))
                .opacity(0.3)
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: 300, height: 150)
                        .foregroundColor(Color(.black))
                        .blur(radius: 90)
                    Text("you lost :(")
                        .foregroundColor(.white)
                        .font(.system(size: 50, weight: .bold, design: .rounded))
                }
                Button(action: {
                    game.resetGame()
                }, label: {
                    ZStack {
                        Capsule()
                            .frame(width: 220, height: 75)
                        Label("Play again", systemImage: "arrow.counterclockwise")
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                })
            }
        }
        .opacity(isAnimating ? 1 : 0)
        .onAppear() {
            withAnimation(.linear(duration: 0.25)) {
                isAnimating = true
            }
        }
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        LoserView(game: Game.sampleGame)
    }
}
