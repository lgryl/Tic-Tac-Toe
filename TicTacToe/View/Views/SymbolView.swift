//
//  SymbolView.swift
//  TicTacToe
//
//  Created by lg on 07/05/2022.
//

import SwiftUI


struct SymbolView: View {
    var symbol: Game.Symbol
    
    var body: some View {
        shape(for: symbol)
            .stroke(gradient(for: symbol), style: .init(lineWidth: 3, lineCap: .round))
            .aspectRatio(contentMode: .fit)
            .padding()
            .padding()
    }
    
    private func shape(for symbol: Game.Symbol) -> some Shape {
        switch symbol {
        case .nought:
            return AnyShape(Circle())
        case .cross:
            return AnyShape(Cross())
        }
    }
    
    private func gradient(for symbol: Game.Symbol) -> some ShapeStyle {
        switch symbol {
        case .nought:
            return LinearGradient(colors: [.blue, .purple], startPoint: .top, endPoint: .bottom)
        case .cross:
            return LinearGradient(colors: [.orange, .red], startPoint: .top, endPoint: .bottom)
        }
    }
}

struct SymbolView_Previews: PreviewProvider {
    static var previews: some View {
        SymbolView(symbol: .nought)
    }
}
