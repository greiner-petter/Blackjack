//
//  WinnerView.swift
//  Blackjack
//
//  Created by Oliver Greiner-Petter on 8/24/23.
//

import SwiftUI

struct WinnerView: View {
    @StateObject var game: Game
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.yellow)
                .opacity(0.75)
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(.systemBackground))
                        .frame(width: 300, height: 150)
                        .blur(radius: 90)
                    Text("you won!")
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

struct WinnerView_Previews: PreviewProvider {
    static var previews: some View {
        WinnerView(game: Game())
    }
}
