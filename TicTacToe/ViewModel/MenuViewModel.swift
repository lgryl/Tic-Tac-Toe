//
//  MenuViewModel.swift
//  TicTacToe
//
//  Created by lg on 09/05/2022.
//

import SwiftUI

class MenuViewModel: ObservableObject {
    @Published var boardSize = 3
    
    func toggleBoardSize() {
        boardSize = (boardSize + 1) % 3 + 3
    }
}
