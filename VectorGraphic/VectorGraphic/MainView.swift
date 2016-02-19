//
//  MainView.swift
//  VectorGraphic
//
//  Created by Hari Kunwar on 2/18/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit

class MainView: UIView {

    override func drawRect(rect: CGRect) {
        // draw a triangle
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 100, y: 100))
        
        // Draw the lines
        path.addLineToPoint(CGPoint(x: 200, y: 100))
        path.addLineToPoint(CGPoint(x: 150, y: 50))
        path.closePath()
//        path.addLineToPoint(CGPoint(x: 0, y: 0))
        path.stroke()
    }
}
