//
//  Game.swift
//  TicTacToe
//
//  Created by lg on 25/04/2022.
//

import Foundation

struct Game {
    private typealias TilePosition = (row: Int, column: Int)
    
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
    
    enum State {
        case ongoing(currentSymbol: Symbol)
        case finished
    }
    
    struct Tile {
        var symbol: Symbol?
        var winning: Bool = false
    }
    
    private(set) var board: [[Tile]]
    private let requiredMatchLength = 3
    private var state = State.ongoing(currentSymbol: .nought)
    
    var boardSize: Int {
        board.count
    }
    
    
    init(boardSize: Int) {
        board = .init(repeating: .init(repeating: .init(), count: boardSize), count: boardSize)
    }
    
    func symbolAt(row: Int, column: Int) -> Symbol? {
        board[row][column].symbol
    }
    
    mutating func makeMoveAt(row: Int, column: Int) {
        //guard <= count
        
        guard case let .ongoing(currentSymbol) = state else { return }
        
        guard board[row][column].symbol == nil else { return }
        
        board[row][column].symbol = currentSymbol
        
        let winningTiles = self.winningTiles(for: currentSymbol)
        
        if winningTiles.count > 0 {
            for tile in winningTiles {
                board[tile.row][tile.column].winning = true
            }
            state = .finished
        } else {
            state = .ongoing(currentSymbol: currentSymbol.next)
        }
    }
    
    private func winningTiles(for symbol: Symbol) -> [TilePosition] {
        var winningTiles: [TilePosition] = []
        
        for rowIndex in 0 ..< boardSize {
            let row = board[rowIndex]
            let matches = row.split { tile in
                tile.symbol != symbol
            }
            
            if let match = matches.first(where: { a in
                a.count >= requiredMatchLength
            }) {
                for x in match.indices {
                    winningTiles.append((row: rowIndex, column: x))
                }
            }
        }
        
        for rowIndex in 0 ..< boardSize {
            let row = board[rowIndex]
            let matches = row.split { tile in
                tile.symbol != symbol
            }
            
            if let match = matches.first(where: { a in
                a.count >= requiredMatchLength
            }) {
                for x in match.indices {
                    winningTiles.append((row: rowIndex, column: x))
                }
            }
        }
        
//        for row in 0 ..< boardSize {
//            let matchingTilePositions = (0 ..< boardSize)
//                .map { (row: row, column: $0) }
//                .filter { board[$0.row][$0.column].symbol == symbol }
//
//            if matchingTilePositions.count == boardSize {
//                winningTiles.append(contentsOf: matchingTilePositions)
//            }
//        }
//
//        for column in 0 ..< boardSize {
//            let matchingTilePositions = (0 ..< boardSize)
//                .map { (row: $0, column: column) }
//                .filter { board[$0.row][$0.column].symbol == symbol }
//
//            if matchingTilePositions.count == boardSize {
//                winningTiles.append(contentsOf: matchingTilePositions)
//            }
//        }
//
//        let matchingDiagonalPositions = (0 ..< boardSize )
//            .map { (row: $0, column: $0) }
//            .filter { board[$0.row][$0.column].symbol == symbol }
//        if matchingDiagonalPositions.count == boardSize {
//            winningTiles.append(contentsOf: matchingDiagonalPositions)
//        }
//
//        let matchingReverseDiagonalPositions = (0 ..< boardSize )
//            .map { (row: $0, column: boardSize - $0 - 1) }
//            .filter { board[$0.row][$0.column].symbol == symbol }
//        if matchingReverseDiagonalPositions.count == boardSize {
//            winningTiles.append(contentsOf: matchingReverseDiagonalPositions)
//        }
        
        return winningTiles
    }
}
