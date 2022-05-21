//
//  TileView.swift
//  TicTacToe
//
//  Created by lg on 07/05/2022.
//

import SwiftUI

struct TileView: View {
    var tile: Game.Tile
    var onTap: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(color(for: tile.winning))
                .aspectRatio(1, contentMode: .fit)
                .shadow(color: Color(white: 0.9), radius: 3, x: 0, y: 5)
            if let symbol = tile.symbol {
                SymbolView(symbol: symbol)
            }
        }
        .onTapGesture {
            onTap()
        }
    }
    
    private func color(for winning: Bool) -> Color {
        winning ? .init(white: 0.95) : .white
    }
}

struct TileView_Previews: PreviewProvider {
    static var previews: some View {
        TileView(tile: .init(symbol: .nought, winning: false), onTap: {})
    }
}
