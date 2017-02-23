//
//  ViewController.swift
//  ReplicatorLayer
//
//  Created by Hari Kunwar on 2/23/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // Create replicator layer.
        let replicator = CAReplicatorLayer()
        replicator.frame = view.bounds
        view.layer.addSublayer(replicator)
        
        // Create dot.
        let dot = CALayer()
        let dotLength: CGFloat = 6.0
        let dotOffset: CGFloat = dotLength + 2.0
        dot.frame = CGRect(
            x: replicator.bounds.size.width - dotOffset,
            y: replicator.position.y,
            width: dotLength, height: dotLength)
        dot.backgroundColor = UIColor.lightGray.cgColor
        dot.borderColor = UIColor(white: 1.0, alpha: 1.0).cgColor
        dot.borderWidth = 0.5
        dot.cornerRadius = 1.5
        
        replicator.addSublayer(dot)
        
        // Create multiple instance of dots
        replicator.instanceCount = Int(view.bounds.size.width/dotOffset)
        replicator.instanceTransform = CATransform3DMakeTranslation(-dotOffset, 0.0, 0.0)
        
        // Add scaling animation
        let scale = CABasicAnimation(keyPath: "transform")
        scale.fromValue = NSValue(caTransform3D: CATransform3DIdentity)
        scale.toValue = NSValue(caTransform3D:
            CATransform3DMakeScale(1.4, 15, 1.0))
        scale.duration = 0.33
        scale.repeatCount = .infinity
        scale.autoreverses = true
        scale.timingFunction = CAMediaTimingFunction(name:
            kCAMediaTimingFunctionEaseOut)
        dot.add(scale, forKey: "dotScale")
        
        // Add fade animation
        let fade = CABasicAnimation(keyPath: "opacity")
        fade.fromValue = 1.0
        fade.toValue = 0.2
        fade.duration = 0.33
        fade.beginTime = CACurrentMediaTime() + 0.33
        fade.repeatCount = .infinity
        fade.autoreverses = true
        fade.timingFunction = CAMediaTimingFunction(name:
            kCAMediaTimingFunctionEaseOut)
        dot.add(fade, forKey: "dotOpacity")
        
        // Taint animation
        let tint = CABasicAnimation(keyPath: "backgroundColor")
        tint.fromValue = UIColor.magenta.cgColor
        tint.toValue = UIColor.cyan.cgColor
        tint.duration = 0.66
        tint.beginTime = CACurrentMediaTime() + 0.28
        tint.fillMode = kCAFillModeBackwards
        tint.repeatCount = Float.infinity
        tint.autoreverses = true
        tint.timingFunction = CAMediaTimingFunction(name:
            kCAMediaTimingFunctionEaseInEaseOut)
        dot.add(tint, forKey: "dotColor")
        
        // Animating CARelicatorLayer properties
        let initialRotation = CABasicAnimation(keyPath:
            "instanceTransform.rotation")
        initialRotation.fromValue = 0.0
        initialRotation.toValue   = 0.01
        initialRotation.duration = 0.33
        initialRotation.isRemovedOnCompletion = false
        initialRotation.fillMode = kCAFillModeForwards
        initialRotation.timingFunction = CAMediaTimingFunction(name:
            kCAMediaTimingFunctionEaseOut)
        replicator.add(initialRotation, forKey: "initialRotation")
        
        // Add delay between different instance animation
        replicator.instanceDelay = 0.02
        
    }

}

