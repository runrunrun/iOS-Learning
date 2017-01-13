//
//  ViewController.swift
//  SpringAnimation
//
//  Created by Hari Kunwar on 1/13/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loginButton.center.y += 30
        self.loginButton.alpha = 0.0

        /**
         • usingSpringWithDamping: This controls the amount of damping, or reduction, applied to the animation as it approaches its final state. This parameter accepts values between 0.0 and 1.0. Values closer to 0.0 create a bouncier animation, while values closer to 1.0 create a stiff-looking effect. You can think of this value as the “stiffness” of the spring.
         • initialSpringVelocity: This controls the initial velocity of the animation. A value of 1.0 sets the velocity of the animation to cover the total distance of the animation in the span of one second. Bigger and smaller values will cause the animation to have more or less velocity.

         */
        UIView.animate(withDuration: 3.0, delay: 0.5, usingSpringWithDamping: 0.1, initialSpringVelocity: 1.0,
                       options: [], animations: {
                        self.loginButton.center.y -= 30
                        self.loginButton.alpha = 1.0
        }, completion: { (done) in
            
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.0,
                       options: [], animations: {
            self.loginButton.bounds.size.width += 80
        }, completion: { (done) in
            UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.0,
                           options: [], animations: {
                            self.loginButton.bounds.size.width -= 80
            }, completion: nil)
        
        })
        
    }

    
}

