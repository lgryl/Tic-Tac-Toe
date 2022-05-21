//
//  MenuViewModel.swift
//  TicTacToe
//
//  Created by lg on 09/05/2022.
//

import SwiftUI

class MenuViewModel: ObservableObject {
    @AppStorage("boardSize") var boardSize = GameVariant.all[0].boardSize
    
    var variant: GameVariant {
        GameVariant.all.first { $0.boardSize == boardSize } ?? GameVariant.all[0]
    }
    
    func toggleBoardSize() {
        guard let index = GameVariant.all.firstIndex(where: { $0.boardSize == boardSize }) else {
            boardSize = GameVariant.all[0].boardSize
            return
        }
        let newIndex = (index + 1) % GameVariant.all.count
        boardSize = GameVariant.all[newIndex].boardSize
    }
}
