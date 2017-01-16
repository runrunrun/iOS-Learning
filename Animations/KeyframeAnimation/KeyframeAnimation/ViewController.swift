//
//  ViewController.swift
//  KeyframeAnimation
//
//  Created by Hari Kunwar on 1/15/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

/**
 Keyframe is used to chain multiple animations together.
 When animation has multiple stages, Keyframe should be used.
 Individual animations are called keyframes and they are added sequentially to generate complete animation.
 */

class ViewController: UIViewController {

    @IBOutlet weak var planeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func flyButtonPressed(_ sender: Any) {
        
        UIView.animateKeyframes(withDuration: 3, delay: 0.0, animations: {
            // Add keyframes
            
            // Move horizontally from start to end
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1/3, animations: {
                self.planeImageView.center.x = self.view.bounds.width/3
            })
            
            // Start take off
            UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 1/3, animations: {
                self.planeImageView.center.x += self.view.bounds.width/3
                self.planeImageView.center.y -= 60
                self.planeImageView.transform = CGAffineTransform(rotationAngle: -.pi/10)
            })
            
            // Gain more height
            UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: 1/3, animations: {
                self.planeImageView.center.x += self.view.bounds.width/3 + 100
                self.planeImageView.center.y -= 80
                self.planeImageView.transform = CGAffineTransform(rotationAngle: -.pi/7)

            })
            
        }, completion: nil)
        
    }
    
    
}

