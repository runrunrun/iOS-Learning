//
//  ViewController.swift
//  LayerSpringsAnimation
//
//  Created by Hari Kunwar on 1/21/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

/**
 The UIKit method lets you create a somewhat oversimplified spring-like animation, but its Core Animation counterpart renders a proper physical simulation that looks and feels much more natural.
 
 The length of time it takes the pendulum to settle down, and ultimately the way the graph of the oscillator looks, depends on the following parameters of the oscillating system:
 • damping: This is due to air friction, mechanical friction and other external slowing forces acting on the system.
 • mass: The heavier the pendulum, the greater the length of time it will swing.
 • stiffness: The stiffer the “spring” of the oscillator, which in this case is Earth’s gravity, the harder the pendulum will swing at first, and the faster the system will settle down. Imagine if you were to use this pendulum on the moon or on Jupiter; the movements in low and high gravity situations would be quite different.
 • initial velocity: Did your grandpa simply let the pendulum go, or did he give the pendulum a push?
 
 */

class ViewController: UIViewController {
    
    @IBOutlet weak var blueView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Spring animation with scaling effect
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.fromValue = 1.25
        pulse.toValue = 1.0
        pulse.duration = pulse.settlingDuration // Time for animation to settle
        pulse.damping = 7.5 // a greater damping value means the pendulum will settle faster.
        blueView.layer.add(pulse, forKey: "pulseAnimation")
    }
    
    @IBAction func jumpButtonPressed(_ sender: Any) {
        let jump = CASpringAnimation(keyPath: "position.y")
        jump.fromValue = blueView.layer.position.y + 1
        jump.toValue = blueView.layer.position.y
        jump.duration = jump.settlingDuration
        
        jump.initialVelocity = 100.0
        jump.mass = 10.0
        jump.stiffness = 1500
        jump.damping = 50.0
        
        blueView.layer.add(jump, forKey: "jumpAnimation")
    }
    
}

