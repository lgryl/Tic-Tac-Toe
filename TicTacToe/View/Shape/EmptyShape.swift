//
//  EmptyShape.swift
//  TicTacToe
//
//  Created by lg on 06/05/2022.
//

import SwiftUI

struct EmptyShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path()
    }
}
