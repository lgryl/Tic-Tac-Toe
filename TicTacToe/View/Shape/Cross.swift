//
//  Cross.swift
//  TicTacToe
//
//  Created by lg on 06/05/2022.
//

import SwiftUI

struct Cross: Shape {
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let size = min(rect.width, rect.height)
        
        let minX = center.x - size / 2
        let maxX = center.x + size / 2
        let minY = center.y - size / 2
        let maxY = center.y + size / 2
        
        let upperLeftCorner = CGPoint(x: minX, y: minY)
        let lowerRightCorner = CGPoint(x: maxX, y: maxY)
        let lowerLeftCorner = CGPoint(x: minX, y: maxY)
        let upperRightCorner = CGPoint(x: maxX, y: minY)
        
        var path = Path()
        
        path.move(to: upperLeftCorner)
        path.addLine(to: lowerRightCorner)
        path.move(to: lowerLeftCorner)
        path.addLine(to: upperRightCorner)
        
        return path
    }
}
