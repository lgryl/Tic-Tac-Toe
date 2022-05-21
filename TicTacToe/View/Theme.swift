//
//  Theme.swift
//  TicTacToe
//
//  Created by lg on 11/05/2022.
//

import SwiftUI

enum Theme {
    enum Colors {
        static let background = Color(white: 250 / 255)
        static let shadow = Color(white: 0.9)
        static let tileDefault = Color.white
        static let tileWinning = Color(white: 0.95)
    }
    enum Gradients {
        static let cold = LinearGradient(colors: [.blue, .purple], startPoint: .top, endPoint: .bottom)
        static let warm = LinearGradient(colors: [.orange, .red], startPoint: .top, endPoint: .bottom)
    }
    enum Animation {
        static let duration = 0.2
    }
}
