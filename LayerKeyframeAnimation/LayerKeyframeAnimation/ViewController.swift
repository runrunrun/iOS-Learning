//
//  ViewController.swift
//  LayerKeyframeAnimation
//
//  Created by Hari Kunwar on 1/22/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

/**
 CAKeyframeAnimation uses an array of values to animate through named values. The elements of values are the measured milestones of your animation. You’ll also need to supply the time that the animation should reach each value’s key point.
 */

class ViewController: UIViewController {

    @IBOutlet weak var greenView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func wobbleButtonPressed(_ sender: Any) {
        let wobble = `CAKeyframeAnimation`(keyPath: "transform.rotation")
        wobble.duration = 0.25
        wobble.repeatCount = 4
        wobble.values = [0.0, -.pi/4.0, 0.0, .pi/4.0, 0.0]
        wobble.keyTimes = [0.0, 0.25, 0.5, 0.75, 1.0]
        greenView.layer.add(wobble, forKey: nil)
    }

}

