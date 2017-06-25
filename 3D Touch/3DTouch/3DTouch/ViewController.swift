//
//  ViewController.swift
//  3DTouch
//
//  Created by Hari Kunwar on 12/14/15.
//  Copyright © 2015 Learning. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    @IBOutlet weak var circle: UIView!
    @IBOutlet weak var forceLabel: UILabel!
    
    @IBOutlet weak var circleLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var circleTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var circleWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var circleHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circle.translatesAutoresizingMaskIntoConstraints = false;
        circle.layer.cornerRadius = circleHeightConstraint.constant/2
        
        circle.layer.borderWidth = 1
        circle.layer.borderColor = UIColor.blue.cgColor
    }
}

// MARK: UIResponder override
extension ViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            // Center the circle to touch position.
            let touchPoint = touch.location(in: self.view)
            circleLeadingConstraint.constant = touchPoint.x - self.circleWidthConstraint.constant/2
            circleTopConstraint.constant = touchPoint.y - self.circleHeightConstraint.constant/2
            break
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchPoint = touch.location(in: self.view)
            print(touch.force)
            // Center the circle to touch position.
            circleLeadingConstraint.constant = touchPoint.x - self.circleWidthConstraint.constant/2
            circleTopConstraint.constant = touchPoint.y - self.circleHeightConstraint.constant/2
            
            // Increase circle size based on touch force.
            circleWidthConstraint.constant += 2 * touch.force
            circleHeightConstraint.constant = self.circleWidthConstraint.constant
            circle.layer.cornerRadius = circleHeightConstraint.constant/2
            break
        }
    }
}

