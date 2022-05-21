//
//  Game.swift
//  TicTacToe
//
//  Created by lg on 25/04/2022.
//

import Foundation

struct Game {
    private enum Constants {
        enum BoardSize {
            static let minimum = 3
            static let maximum = 6
        }
    }
    
    enum Symbol {
        case nought
        case cross
        
        var next: Self {
            switch self {
            case .nought:
                return .cross
            case .cross:
                return .nought
            }
        }
    }
    
    private(set) var board: [[Symbol?]]
    private var currentSymbol: Symbol = .nought
    
    var boardSize: Int {
        board.count
    }
    
    
    init(boardSize: Int) {
        let normalizedBoardSize = max(Constants.BoardSize.minimum, min(boardSize, Constants.BoardSize.maximum))
        board = .init(repeating: .init(repeating: nil, count: normalizedBoardSize), count: normalizedBoardSize)
    }
    
    func symbolAt(row: Int, column: Int) -> Symbol? {
        board[row][column]
    }
    
    mutating func makeMoveAt(row: Int, column: Int) {
        //guard <= count
        guard board[row][column] == nil else { return }
        
        board[row][column] = currentSymbol
        currentSymbol = currentSymbol.next
    }
}
