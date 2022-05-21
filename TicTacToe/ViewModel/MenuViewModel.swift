//
//  MenuViewModel.swift
//  TicTacToe
//
//  Created by lg on 09/05/2022.
//

import SwiftUI

class MenuViewModel: ObservableObject {
    enum BoardSize {
        static let minimum = 3
        static let maximum = 5
    }
    
    @AppStorage("boardSize") var boardSize = BoardSize.minimum
    
    func toggleBoardSize() {
        let boardSizeRange = (BoardSize.maximum - BoardSize.minimum + 1)
        boardSize = (boardSize - BoardSize.minimum +  1) % boardSizeRange + BoardSize.minimum
    }
}
