//
//  ContentView.swift
//  TicTacToe
//
//  Created by lg on 25/04/2022.
//

import SwiftUI

struct GameView: View {
    @ObservedObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                ForEach(0..<viewModel.game.boardSize, id: \.self) { row in
                    HStack {
                        ForEach(0..<viewModel.game.boardSize, id: \.self) { column in
                            GameTileView(tile: viewModel.game.board[row][column])
                                .onTapGesture {
                                    viewModel.makeMoveAt(row: row, column: column)
                                }
                        }
                    }
                }
            }
            .padding()
            Spacer()
            HStack {
                button(imageName: "chevron.backward", action: {
                    print("Back")
                })
                .frame(maxWidth: 100)
                Spacer()
                button(imageName: "arrow.counterclockwise", action: {
                    viewModel.resetGame()
                })
                .frame(maxWidth: 100)
            }
            .padding(.horizontal)
        }
        .background(Color(white: 250 / 255))
    }
    
    private func button(imageName: String, action: @escaping () -> Void) -> some View {
        TileView {
            Button {
                action()
            } label: {
                Image(systemName: imageName)
                    .font(.title)
                    .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .top, endPoint: .bottom))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .previewDevice("iPhone 13 Pro Max")
            .previewInterfaceOrientation(.portraitUpsideDown)
        GameView()
            .previewDevice("iPhone SE (3rd generation)")
    }
}
