//
//  ViewController.swift
//  ShapeMasks
//
//  Created by Hari Kunwar on 1/24/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

/**
 Sample showing how to apply Shape Mask and animate it.
 */

class ViewController: UIViewController {
    
    @IBOutlet weak var babyImageView: UIImageView!
    let circleLayer = CAShapeLayer()
    let maskLayer = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var bounds = babyImageView.bounds
        bounds.size.width -= 10
        bounds.size.height -= 10
        
        //Draw the circle
        circleLayer.path = UIBezierPath(ovalIn: bounds).cgPath
        circleLayer.strokeColor = UIColor.white.cgColor
        circleLayer.lineWidth = 5.0
        circleLayer.fillColor = UIColor.clear.cgColor
        
        //Size the layer
        maskLayer.path = circleLayer.path
        maskLayer.position = CGPoint(x: 0.0, y: 0.0)
        
        babyImageView.layer.mask = maskLayer
        babyImageView.layer.addSublayer(circleLayer)
    }

    @IBAction func morphButtonPressed(_ sender: Any) {
        var bounds = babyImageView.bounds
        bounds.size.width -= 50
        
        let morphAnimation = CABasicAnimation(keyPath: "path")
        morphAnimation.duration = 1.0
        morphAnimation.toValue = UIBezierPath(ovalIn: bounds).cgPath
        morphAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        morphAnimation.fillMode = kCAFillModeBoth
        
        // This will prevent animation jumping back to initial state
        morphAnimation.isRemovedOnCompletion = false
        
        circleLayer.add(morphAnimation, forKey: nil)
        maskLayer.add(morphAnimation, forKey: nil)
    }
}

