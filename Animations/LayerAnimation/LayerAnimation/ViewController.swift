//
//  ViewController.swift
//  LayerAnimation
//
//  Created by Hari Kunwar on 1/17/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

/**
 Layer animations work much like view animations; you simply animate a property between a start and an end value over a defined period of time 
 
 Layers have a bigger number of animatable properties than views.
 
 Animation objects in Core Animation are simply data models; you create an instance of the model and set its data properties accordingly.
 
 kCAFillModeBoth
 kCAFillModeBoth is a combination of kCAFillModeForwards and kCAFillModeBackwards; as you’d expect, this makes the first frame of the animation appear on the screen immediately and retains the final frame on the screen when
 the animation is finished
 */

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
        moveRight.beginTime = CACurrentMediaTime() + 10
        moveRight.fillMode = kCAFillModeBoth
        
        // forKey is used as identifier for this animation.
        userNameField.layer.add(moveRight, forKey: "userNameAnimation")
        passwordField.layer.add(moveRight, forKey: "passwordAnimation")
        loginButton.layer.add(moveRight, forKey: "loginAnimation")
    }

}

