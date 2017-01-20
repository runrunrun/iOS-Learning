//
//  ViewController.swift
//  AnimationGroups
//
//  Created by Hari Kunwar on 1/20/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

/**
 CAAnimationGroup, lets you add several animations to a group and adjust properties such as duration, delegate, and timingFunction all at once.
 
 Animation easing
 • kCAMediaTimingFunctionLinear: runs the animation with an equal pace throughout its whole duration.
 • kCAMediaTimingFunctionEaseIn: starts slower and finishes at a faster pace.
 • kCAMediaTimingFunctionEaseOut: animations starts out faster and slows down as it finishes.
 • kCAMediaTimingFunctionEaseInEaseOut slows the animation in the beginning and at the end, but increases the pace during the middle section.
 */

class ViewController: UIViewController {

    @IBOutlet weak var startLifeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Animation group
        let groupAnimation = CAAnimationGroup()
        groupAnimation.beginTime = CACurrentMediaTime() + 0.5
        groupAnimation.duration = 0.5
        // Start and end frame is shown.
        groupAnimation.fillMode = kCAFillModeBoth
        groupAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)

        
        // Scaling animation
        let scaleDown = CABasicAnimation(keyPath: "transform.scale")
        scaleDown.fromValue = 3.5
        scaleDown.toValue = 1.0 // Normal size
        
        // Rotate animation
        let rotate = CABasicAnimation(keyPath: "transform.rotation")
        rotate.fromValue = .pi/4.0
        rotate.toValue = 0.0
        
        // Fading animation
        let fade = CABasicAnimation(keyPath: "opacity")
        fade.fromValue = 0.0
        fade.toValue = 1.0
        
        // Repeating animation
        groupAnimation.repeatCount = 2.5
        
        // Reverse animation
        groupAnimation.autoreverses = true
        
        // Change animation speed
        groupAnimation.speed = 2.0
        
        groupAnimation.animations = [scaleDown, rotate, fade]
        startLifeButton.layer.add(groupAnimation, forKey: "loadingAnimation")
    }

}

