//
//  ViewController.swift
//  ConstraintAnimation
//
//  Created by Hari Kunwar on 1/16/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

/**
 Usually you simply replace an existing constraint with a new one and let Auto Layout animate the UI between the two states.
 
 The sole exception is when you only need to change a single property of the constraint, such as constant, in the constraint’s equation. In that case, you simply modify the constraint directly in code and animate the change.
 */

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    private var isSizeToggled = false
    private var isCenterYConstraintToggled = false
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var centerYConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Animating property change
    @IBAction func animateSizeButtonPressed(_ sender: Any) {
        isSizeToggled = !isSizeToggled
        
        // Animate constraint change
        
        // Call layoutIfNeeded in superview
        view.layoutIfNeeded()
        UIView.animate(withDuration: 0.5) {
            
            // Change constraint constant
            for constraint in self.colorView.constraints {
                let multiplier: CGFloat = self.isSizeToggled ? 2 : 1/2
                if constraint.identifier == "widthConstraint" {
                    constraint.constant = multiplier * constraint.constant
                }
                
                if constraint.identifier == "heightConstraint" {
                    constraint.constant = multiplier * constraint.constant
                }
            }
            
            // Call layoutIfNeeded in superview
            self.view.layoutIfNeeded()
        }
    }

    @IBAction func animateConstraintChangeButtonPressed(_ sender: Any) {
        isCenterYConstraintToggled = !isCenterYConstraintToggled
        
        // Call layoutIfNeeded in superview
        view.layoutIfNeeded()
        UIView.animate(withDuration: 0.5) {
            // Install or uninstall constraint by setting isActive property in constraints.
            self.topConstraint.isActive = !self.isCenterYConstraintToggled
            self.centerYConstraint.isActive = self.isCenterYConstraintToggled
            // Call layoutIfNeeded in superview
            self.view.layoutIfNeeded()
        }
    }
}

