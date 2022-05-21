//
//  MenuView.swift
//  TicTacToe
//
//  Created by lg on 07/05/2022.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject private var viewModel = MenuViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                logoView
                    .padding()
                Spacer()
                boardSizeButton
                playButton
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(Theme.Colors.background)
        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
    }
    
    var logoView: some View {
        let symbolSize: CGFloat = 150
        return HStack {
            SymbolView(symbol: .nought)
                .frame(maxWidth: symbolSize)
                .padding()
            SymbolView(symbol: .cross)
                .frame(maxWidth: symbolSize)
                .padding()
        }
    }
    
    var boardSizeButton: some View {
        Button {
            viewModel.toggleBoardSize()
        } label: {
            TileView {
                Text("\(viewModel.boardSize)x\(viewModel.boardSize)")
                    .font(.title)
                    .foregroundStyle(Theme.Gradients.cold)
            }
        }
        .frame(maxWidth: 125)
        .padding(.bottom)
    }
    
    var playButton: some View {
        NavigationLink(destination: GameView(variant: viewModel.variant)) {
            TileView {
                Image(systemName: "play")
                    .font(.title)
                    .foregroundStyle(Theme.Gradients.cold)
            }
            .frame(maxWidth: 125)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
