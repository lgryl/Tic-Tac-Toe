//
//  GameVariant.swift
//  TicTacToe
//
//  Created by lg on 16/05/2022.
//

import Foundation

struct GameVariant {
    let boardSize: Int
    let matchSize: Int
    
    static var all: [GameVariant] {
        [
            .init(boardSize: 3, matchSize: 3),
            .init(boardSize: 6, matchSize: 4),
            .init(boardSize: 8, matchSize: 5)
        ]
    }
}
