//
//  ViewModel.swift
//  TicTacToe
//
//  Created by lg on 25/04/2022.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published private(set) var game = Game(boardSize: 3)
    
    func makeMoveAt(row: Int, column: Int) {
        game.makeMoveAt(row: row, column: column)
    }
    
    func resetGame() {
        game = Game(boardSize: 3)
    }
}
