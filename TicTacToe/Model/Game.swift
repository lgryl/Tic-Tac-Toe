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
    
    private enum State {
        case ongoing(currentSymbol: Symbol)
        case finished
    }
    
    struct Tile: Equatable {
        var symbol: Symbol?
        var winning: Bool = false
    }
    
    private let variant: GameVariant
    private(set) var board: [[Tile]]
    private var requiredMatchLength: Int { variant.matchSize }
    private var state = State.ongoing(currentSymbol: .nought)
    
    var boardSize: Int {
        board.count
    }
    
    
    init(variant: GameVariant) {
        self.variant = variant
        board = .init(repeating: .init(repeating: .init(), count: variant.boardSize), count: variant.boardSize)
    }
    
    func symbolAt(row: Int, column: Int) -> Symbol? {
        board[row][column].symbol
    }
    
    mutating func makeMoveAt(row: Int, column: Int) {
        guard row >= 0 && row < boardSize && column >= 0 && column < boardSize else { return }
        guard case let .ongoing(currentSymbol) = state else { return }
        guard board[row][column].symbol == nil else { return }
        
        board[row][column].symbol = currentSymbol
        
        let winningTiles = self.winningTiles(for: currentSymbol)
        if !winningTiles.isEmpty {
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
            let symbolGroups = row.split { tile in
                tile.symbol != symbol
            }
            
            if let match = symbolGroups.first(where: { $0.count >= requiredMatchLength }) {
                match.indices.forEach { index in winningTiles.append((row: rowIndex, column: index)) }
            }
        }
        
        for columnIndex in 0 ..< boardSize {
            let column = column(at: columnIndex)
            let symbolGroups = column.split { tile in
                tile.symbol != symbol
            }
            
            if let match = symbolGroups.first(where: { $0.count >= requiredMatchLength }) {
                match.indices.forEach { index in winningTiles.append((row: index, column: columnIndex)) }
            }
        }
        
        for diagonalPositions in diagonalsPositions() {
            let symbolGroups = diagonalPositions.split { position in
                board[position.row][position.column].symbol != symbol
            }
            
            if let match = symbolGroups.first(where: { $0.count >= requiredMatchLength }) {
                match.forEach { position in winningTiles.append((row: position.row, column: position.column)) }
            }
        }
        
        for reverseDiagonalPositions in reverseDiagonalsPositions() {
            let symbolGroups = reverseDiagonalPositions.split { position in
                board[position.row][position.column].symbol != symbol
            }
            
            if let match = symbolGroups.first(where: { $0.count >= requiredMatchLength }) {
                match.forEach { position in winningTiles.append((row: position.row, column: position.column)) }
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
    
    private func diagonalStartPositions() -> [(row: Int, column: Int)] {
        (0 ... boardSize - requiredMatchLength).map { (row: $0, column: 0) } + (0 ... boardSize - requiredMatchLength).map { (row: 0, column: $0 )} // remove duplicate
    }
    
    private func diagonalsPositions() -> [[(row: Int, column: Int)]] {
        diagonalStartPositions().map { diagonal(startingAt: $0) }
    }
    
    private func diagonal(startingAt position: (row: Int, column: Int)) -> [(row: Int, column: Int)] {
        let length = boardSize - max(position.row, position.column)
        return ( 0 ..< length ).map { (row: position.row + $0, column: position.column + $0) }
    }
    
    private func reverseDiagonalsStartPositions() -> [(row: Int, column: Int)] {
        (0 ... boardSize - requiredMatchLength).map { (row: $0, column: boardSize - 1) } + (0 + requiredMatchLength - 1 ... boardSize - 1).map { (row: 0, column: $0 )} // remove duplicate
    }
    
    private func reverseDiagonalsPositions() -> [[(row: Int, column: Int)]] {
        reverseDiagonalsStartPositions().map { reverseDiagonal(startingAt: $0) }
    }
    
    private func reverseDiagonal(startingAt position: (row: Int, column: Int)) -> [(row: Int, column: Int)] {
        let length = boardSize - max(position.row, boardSize - position.column - 1)
        return ( 0 ..< length ).map { (row: position.row + $0, column: position.column - $0) }
    }
}
