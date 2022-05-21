//
//  GameTileView.swift
//  TicTacToe
//
//  Created by lg on 07/05/2022.
//

import SwiftUI

struct GameTileView: View {
    let tile: Game.Tile
    
    var body: some View {
        GeometryReader { geometry in
            TileView(fillColor: color(for: tile.winning)) {
                if let symbol = tile.symbol {
                    SymbolView(symbol: symbol)
                        .frame(width: geometry.size.width * 0.7, height: geometry.size.height * 0.7, alignment: .center)
                }
            }
        }
        .aspectRatio(contentMode: .fit)
    }
    
    private func color(for winning: Bool) -> Color {
        winning ? .init(white: 0.95) : .white
    }
}

struct GameTileView_Previews: PreviewProvider {
    static var previews: some View {
        GameTileView(tile: .init(symbol: .nought, winning: true))
    }
}
