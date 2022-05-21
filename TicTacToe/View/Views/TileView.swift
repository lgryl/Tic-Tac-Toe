//
//  TileView.swift
//  TicTacToe
//
//  Created by lg on 07/05/2022.
//

import SwiftUI

struct TileView<Content>: View where Content: View {
    private let fillColor: Color
    private var content: () -> Content
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(fillColor)
                .aspectRatio(1, contentMode: .fit)
                .shadow(color: Color(white: 0.9), radius: 3, x: 0, y: 5)
            content()
        }
    }
    
    init(fillColor: Color = .white, @ViewBuilder content: @escaping () -> Content) {
        self.fillColor = fillColor
        self.content = content
    }
}

struct TileView_Previews: PreviewProvider {
    static var previews: some View {
        TileView {
            EmptyView()
        }
        .padding()
    }
}
