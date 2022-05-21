//
//  ViewModel.swift
//  TicTacToe
//
//  Created by lg on 25/04/2022.
//

import SwiftUI

class GameViewModel: ObservableObject {
    private static let defaultBoardSize = 3
    private let variant: GameVariant
    
    @Published private(set) var game: Game
    
    init(variant: GameVariant) {
        self.variant = variant
        self.game = GameViewModel.createGame(variant: variant)
    }
    
    func makeMoveAt(row: Int, column: Int) {
        game.makeMoveAt(row: row, column: column)
    }
    
    func resetGame() {
        game = GameViewModel.createGame(variant: variant)
    }
    
    private static func createGame(variant: GameVariant) -> Game {
        Game(variant: variant)
    }
}
