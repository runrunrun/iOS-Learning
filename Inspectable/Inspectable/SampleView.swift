//
//  SampleView.swift
//  Inspectable
//
//  Created by Hari Kunwar on 2/9/15.
//  Copyright (c) 2015 test. All rights reserved.
//

import UIKit

@IBDesignable
class SampleView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBInspectable var lineWidth: CGFloat = 10
    @IBInspectable var fillColor: UIColor = UIColor.greenColor()
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let myFrame = self.bounds
        CGContextSetLineWidth(context, lineWidth)
        CGRectInset(myFrame, 5, 5)
        fillColor.set()
        UIRectFrame(myFrame)
    }
    
    
}
