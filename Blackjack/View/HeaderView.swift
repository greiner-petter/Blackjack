//
//  HeaderView.swift
//  Blackjack
//
//  Created by Oliver Greiner-Petter on 8/25/23.
//

import SwiftUI

struct HeaderView: View {
    @Binding var showingInfoSheet: Bool
    var body: some View {
        HStack {
            Text("Blackjack")
                .font(.largeTitle)
                .fontWeight(.bold)
                .fontDesign(.rounded)
            Spacer()
            VStack {
                Button(action: {
                    showingInfoSheet = true
                }, label: {
                    HStack {
                        Text("Rules")
                        Image(systemName: "info.circle")
                    }
                    .font(.headline)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .foregroundColor(.gray)
                })
                Spacer()
            }
        }
        .padding()
        .frame(height: 50)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(showingInfoSheet: .constant(false))
    }
}
