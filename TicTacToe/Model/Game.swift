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
    
    struct Tile: Equatable {
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
            let row = row(at: rowIndex)
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
        
        for columnIndex in 0 ..< boardSize {
            let column = column(at: columnIndex)
            let matches = column.split { tile in
                tile.symbol != symbol
            }
            
            if let match = matches.first(where: { a in
                a.count >= requiredMatchLength
            }) {
                for x in match.indices {
                    winningTiles.append((row: x, column: columnIndex))
                }
            }
        }
        
        let diagonalStartPositions = (0 ... boardSize - requiredMatchLength).map { (row: $0, column: 0) } + (0 ... boardSize - requiredMatchLength).map { (row: 0, column: $0 )} // remove duplicate
        for startPosition in diagonalStartPositions {
            let diagonalPositions = self.diagonal(startingAt: startPosition)
            
            let matches = diagonalPositions.split { position in
                board[position.row][position.column].symbol != symbol
            }
            
            if let match = matches.first(where: { a in
                a.count >= requiredMatchLength
            }) {
                for x in match {
                    winningTiles.append((row: x.row, column: x.column))
                }
            }
        }
        
        let reverseDiagonalStartPositions = (0 ... boardSize - requiredMatchLength).map { (row: $0, column: boardSize - 1) } + (0 + requiredMatchLength - 1 ... boardSize - 1).map { (row: 0, column: $0 )}
        for startPosition in reverseDiagonalStartPositions {
            let reverseDiagonalPositions = self.reverseDiagonal(startingAt: startPosition)
            
            let matches = reverseDiagonalPositions.split { position in
                board[position.row][position.column].symbol != symbol
            }
            
            if let match = matches.first(where: { a in
                a.count >= requiredMatchLength
            }) {
                for x in match {
                    winningTiles.append((row: x.row, column: x.column))
                }
            }
        }
        
        return winningTiles
    }
    
    private func row(at index: Int) -> [Tile] {
        guard index >= 0, index < boardSize else { return [] }
        return board[index]
    }
    
    private func column(at index: Int) -> [Tile] {
        guard index >= 0, index < boardSize else { return [] }
        return board.map { $0[index] }
    }
    
    private func diagonal(startingAt position: (row: Int, column: Int)) -> [(row: Int, column: Int)] {
        let length = boardSize - max(position.row, position.column)
        return ( 0 ..< length ).map { (row: position.row + $0, column: position.column + $0) }
    }
    
    private func reverseDiagonal(startingAt position: (row: Int, column: Int)) -> [(row: Int, column: Int)] {
        let length = boardSize - max(position.row, boardSize - position.column - 1)
        return ( 0 ..< length ).map { (row: position.row + $0, column: position.column - $0) }
    }
}
