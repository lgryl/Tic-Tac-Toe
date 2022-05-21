//
//  ContentView.swift
//  TicTacToe
//
//  Created by lg on 25/04/2022.
//

import SwiftUI

struct GameView: View {
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject private var viewModel: GameViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                BoardView(board: viewModel.game.board, onTileSelected: { row, column in
                    viewModel.makeMoveAt(row: row, column: column)
                })
                .padding()
                Spacer()
                navigationRow()
                    .padding()
            }
            .background(Theme.Colors.background)
            .navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(.stack)
    }
        
    init(boardSize: Int) {
        viewModel = GameViewModel(boardSize: boardSize)
    }
}

private extension GameView {
    func navigationRow() -> some View {
        HStack {
            navigationButton(imageName: "arrow.backward") {
                presentationMode.wrappedValue.dismiss()
            }
            Spacer()
            navigationButton(imageName: "arrow.counterclockwise") {
                viewModel.resetGame()
            }
        }
    }
    
    func navigationButton(imageName: String, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            TileView {
                Image(systemName: imageName)
                    .font(.title)
                    .foregroundStyle(Theme.Gradients.cold)
            }
        }
        .frame(maxWidth: 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(boardSize: 3)
            .previewDevice("iPhone 13 Pro Max")
        GameView(boardSize: 5)
            .previewDevice("iPhone SE (3rd generation)")
    }
}
