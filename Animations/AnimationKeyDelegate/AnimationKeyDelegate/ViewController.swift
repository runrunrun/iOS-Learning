//
//  ViewController.swift
//  AnimationKeyDelegate
//
//  Created by Hari Kunwar on 1/18/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Animation is not bound to a specific layer. It can be reused on multiple layers.
        let moveRight = CABasicAnimation(keyPath: "position.x")
        moveRight.fromValue = -view.bounds.width/2
        moveRight.toValue = view.bounds.width/2
        moveRight.duration = 0.5
        moveRight.beginTime = CACurrentMediaTime() + 0.3
        moveRight.fillMode = kCAFillModeBoth
        
        // Add animation name
        moveRight.setValue("form", forKey: "name")

        // Add delegate
        moveRight.delegate = self
        
        // forKey is used as identifier for this animation.
        userNameField.layer.add(moveRight, forKey: "userNameAnimation")
        moveRight.setValue(userNameField.layer, forKey: "layer")
        
        passwordField.layer.add(moveRight, forKey: "passwordAnimation")
        moveRight.setValue(passwordField.layer, forKey: "layer")

        loginButton.layer.add(moveRight, forKey: "loginAnimation")
        moveRight.setValue(loginButton.layer, forKey: "layer")

    }
}

extension ViewController: CAAnimationDelegate {
    func animationDidStart(_ anim: CAAnimation) {
        print("Animation started")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print("Animation Ended")
        
        guard let name = anim.value(forKey: "name") as? String else {
            return
        }
        
        if name == "form" {
            let layer = anim.value(forKey: "layer") as? CALayer
            print(layer)
            
            // Add pulse animation to layer
            let pulse = CABasicAnimation(keyPath: "transform.scale")
            pulse.fromValue = 1.25
            pulse.toValue = 1.0
            pulse.duration = 0.25
            layer?.add(pulse, forKey: nil)
        }
    }
}
