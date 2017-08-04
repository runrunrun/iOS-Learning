//
//  WhiteBoard.swift
//  DesignPatterns
//
//  Created by Hari Kunwar on 8/4/17.
//  Copyright © 2017 learning. All rights reserved.
//

import Foundation

protocol Shape {
    func draw(fillColor: String)
}

final class Square: Shape {
    func draw(fillColor: String) {
        print("Drawing a square with color \(fillColor)")
    }
}

final class Circle: Shape {
    func draw(fillColor: String) {
        print("Drawing a circle with color \(fillColor)")
    }
}

final class Whiteboard: Shape {
    lazy var shapes: [Shape] = []
    
    init(_ shapes: Shape...) {
        self.shapes = shapes
    }
    
    func draw(fillColor: String) {
        for shape in self.shapes {
            shape.draw(fillColor: fillColor)
        }
    }
}
