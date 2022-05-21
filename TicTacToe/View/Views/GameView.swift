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
            Spacer()
            VStack {
                ForEach(0..<viewModel.game.boardSize, id: \.self) { row in
                    HStack {
                        ForEach(0..<viewModel.game.boardSize, id: \.self) { column in
                            GameTileView(tile: viewModel.game.board[row][column])
                            .onTapGesture {
                                viewModel.makeMoveAt(row: row, column: column)
                            }
                        }
                    }
                }
            }
            .padding()
            Spacer()
            Button("Play again?") {
                viewModel.resetGame()
            }
        }
        .background(Color(white: 250 / 255))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
