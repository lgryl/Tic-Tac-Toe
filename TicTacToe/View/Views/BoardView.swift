//
//  BoardView.swift
//  TicTacToe
//
//  Created by lg on 07/05/2022.
//

import SwiftUI

struct BoardView: View {
    var board: [[Game.Tile]]
    var boardSize: Int { board.count }
    var onTileSelected: (_ row: Int, _ column: Int) -> Void
    
    var body: some View {
        VStack {
            ForEach(0 ..< boardSize, id: \.self) { row in
                HStack {
                    ForEach(0 ..< boardSize, id: \.self) { column in
                        GameTileView(tile: board[row][column])
                            .onTapGesture {
                                onTileSelected(row, column)
                            }
                    }
                }
            }
        }
    }
}

//struct BoardView_Previews: PreviewProvider {
//    static var previews: some View {
//        BoardView(board: <#T##[[Game.Tile]]#>, onTileSelected: <#T##(Int, Int) -> Void##(Int, Int) -> Void##(_ row: Int, _ column: Int) -> Void#>)
//    }
//}
