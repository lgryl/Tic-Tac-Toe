//
//  ViewModel.swift
//  TicTacToe
//
//  Created by lg on 25/04/2022.
//

import SwiftUI

class GameViewModel: ObservableObject {
    private static let defaultBoardSize = 3
    private let boardSize: Int
    
    @Published private(set) var game: Game
    
    init(boardSize: Int = GameViewModel.defaultBoardSize) {
        self.boardSize = boardSize
        self.game = GameViewModel.createGame(boardSize: boardSize)
    }
    
    func makeMoveAt(row: Int, column: Int) {
        game.makeMoveAt(row: row, column: column)
    }
    
    func resetGame() {
        game = GameViewModel.createGame(boardSize: boardSize)
    }
    
    private static func createGame(boardSize: Int) -> Game {
        Game(boardSize: boardSize)
    }
}
