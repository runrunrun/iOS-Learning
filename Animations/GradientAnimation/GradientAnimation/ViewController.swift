//
//  ViewController.swift
//  GradientAnimation
//
//  Created by Hari Kunwar on 2/11/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

/**
 CAGradientLayer offers you four animatable properties along with the ones inherited from CALayer:
 • colors: Animate the gradient’s colors to give it a tint.
 • locations: Animate the color milestone locations to make the colors move
 around inside the gradient.
 • startPoint and endPoint: Animate the extents of the layout of the gradient.
 */

class ViewController: UIViewController {
    @IBOutlet weak var gradientView: UIView!
    let gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.colors = [UIColor.black.cgColor, UIColor.white.cgColor, UIColor.black.cgColor]
        //Location specifies each color locations
        gradientLayer.locations = [0.15, 0.5, 0.85]
        gradientLayer.frame = gradientView.bounds
        gradientView.layer.addSublayer(gradientLayer)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Add gradient animation
        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        //Location specifies each color locations
        gradientAnimation.fromValue = [0.0, 0.10, 0.20]
        gradientAnimation.toValue = [0.80, 0.90, 1.0]
        gradientAnimation.duration = 3.0
        gradientAnimation.repeatCount = Float.infinity
        gradientLayer.add(gradientAnimation, forKey: "gradientAnimation")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

