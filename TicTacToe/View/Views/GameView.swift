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
            .background(Color(white: 250 / 255))
            .navigationBarHidden(true)
        }
        .navigationViewStyle(.stack)
    }
        
    private func navigationRow() -> some View {
        HStack {
            NavigationLink(destination: Text("Foo")) {
                TileView {
                    Image(systemName: "arrow.backward")
                        .font(.title)
                        .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .top, endPoint: .bottom))
                }
            }
            .frame(maxWidth: 100)
            Spacer()
            Button {
                viewModel.resetGame()
            } label: {
                TileView {
                    Image(systemName: "arrow.counterclockwise")
                        .font(.title)
                        .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .top, endPoint: .bottom))
                }
            }
            .frame(maxWidth: 100)
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
