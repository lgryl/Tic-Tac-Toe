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
            Text("Tic Tac Toe")
                .font(.largeTitle)
                .padding(.top)
            Spacer()
            VStack {
                ForEach(0..<viewModel.game.boardSize, id: \.self) { row in
                    HStack {
                        ForEach(0..<viewModel.game.boardSize, id: \.self) { column in
                            TileView(tile: viewModel.game.board[row][column]) {
                                viewModel.makeMoveAt(row: row, column: column)
                            }
                        }
                    }
                }
            }
            .padding()
            Spacer()
            Button("Play again?") {
                viewModel.resetGame()
            }
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

struct TileView: View {
    var tile: Game.Tile
    var onTap: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(color(for: tile.winning))
                .aspectRatio(1, contentMode: .fit)
            if let shape = self.shape(for: tile.symbol) {
                shape
                    .stroke(style: .init(lineWidth: 5, lineCap: .round))
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .padding()
            }
            
        }
        .onTapGesture {
            onTap()
        }
    }
    
    private func shape(for symbol: Game.Symbol?) -> some Shape {
        guard let symbol = symbol else {
            return AnyShape(EmptyShape())
        }
        
        switch symbol {
        case .nought:
            return AnyShape(Circle())
        case .cross:
            return AnyShape(Cross())
        }
    }
    
    private func imageName(for symbol: Game.Symbol?) -> String? {
        guard let symbol = symbol else {
            return nil
        }
        
        switch symbol {
        case .nought: return "circle"
        case .cross: return "xmark"
        }
    }
    
    private func color(for winning: Bool) -> Color {
        winning ? .green : .blue
    }
}

struct AnyShape: Shape {
    private let _path: (CGRect) -> Path
    
    init<S: Shape>(_ wrapped: S) {
        _path = { rect in
            wrapped.path(in: rect)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        _path(rect)
    }
}
