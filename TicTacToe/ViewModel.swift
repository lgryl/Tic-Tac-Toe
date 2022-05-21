//
//  ViewModel.swift
//  TicTacToe
//
//  Created by lg on 25/04/2022.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published private(set) var game = Game(boardSize: 4)
    
    func makeMoveAt(row: Int, column: Int) {
        game.makeMoveAt(row: row, column: column)
    }
    
    func textFor(row: Int, column: Int) -> String? {
        guard let symbol = game.symbolAt(row: row, column: column) else { return nil }
        
        switch symbol {
        case .nought:
            return "O"
        case .cross:
            return "X"
        }
    }
}
