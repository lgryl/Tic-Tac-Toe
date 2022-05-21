//
//  MenuView.swift
//  TicTacToe
//
//  Created by lg on 07/05/2022.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                HStack {
                    SymbolView(symbol: .nought)
                        .frame(maxWidth: 150)
                        .padding()
                    SymbolView(symbol: .cross)
                        .frame(maxWidth: 150)
                        .padding()
                }
                .padding()
                Spacer()
                TileView {
                    Text("3x3")
                        .font(.title)
                        .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .top, endPoint: .bottom))
                }
                .frame(maxWidth: 125)
                .padding(.bottom)
                NavigationLink(destination: GameView()) {
                    TileView {
                        Image(systemName: "play")
                            .font(.title)
                            .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .top, endPoint: .bottom))
                    }
                    .frame(maxWidth: 125)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(Color(white: 250 / 255))
        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
        MenuView()
            .previewDevice("iPhone 13 Pro Max")
    }
}
