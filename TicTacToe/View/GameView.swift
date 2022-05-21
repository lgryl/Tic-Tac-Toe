//
//  ContentView.swift
//  TicTacToe
//
//  Created by lg on 25/04/2022.
//

import SwiftUI

struct GameView: View {
    @ObservedObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            ForEach(0..<viewModel.game.boardSize, id: \.self) { row in
                HStack {
                    ForEach(0..<viewModel.game.boardSize, id: \.self) { column in
                        TileView(imageName: imageName(for: viewModel.game.symbolAt(row: row, column: column))) {
                            viewModel.makeMoveAt(row: row, column: column)
                        }
                    }
                }
            }
        }
        .padding()
    }
    
    private func imageName(for symbol: Game.Symbol?) -> String? {
        guard let symbol = symbol else {
            return nil
        }

        switch symbol {
        case .nought: return "circle"
        case .cross: return "xmark"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

struct TileView: View {
    var imageName: String?
    var onTap: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(.blue)
                .aspectRatio(1, contentMode: .fit)
            if let imageName = imageName {
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }
            
        }
        .onTapGesture {
            onTap()
        }
    }
}
