//
//  ViewModel.swift
//  TicTacToe
//
//  Created by lg on 25/04/2022.
//

import SwiftUI

class ViewModel: ObservableObject {
    private static let defaultBoardSize = 3
    
    @Published private(set) var game = ViewModel.createGame()
    
    func makeMoveAt(row: Int, column: Int) {
        game.makeMoveAt(row: row, column: column)
    }
    
    func resetGame() {
        game = ViewModel.createGame()
    }
    
    private static func createGame() -> Game {
        Game(boardSize: ViewModel.defaultBoardSize)
    }
}
