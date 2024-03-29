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
        GeometryReader { geometry in
            shape(for: symbol)
                .stroke(gradient(for: symbol), style: .init(lineWidth: geometry.size.width * 0.03, lineCap: .round))
                .aspectRatio(contentMode: .fit)
        }
        .aspectRatio(contentMode: .fit)
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
            return Theme.Gradients.cold
        case .cross:
            return Theme.Gradients.warm
        }
    }
}

struct SymbolView_Previews: PreviewProvider {
    static var previews: some View {
        SymbolView(symbol: .nought)
    }
}
