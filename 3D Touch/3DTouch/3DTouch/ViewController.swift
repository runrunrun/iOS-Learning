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
        // Do any additional setup after loading the view, typically from a nib.
        
        self.circle.translatesAutoresizingMaskIntoConstraints = false;
        self.circle.layer.cornerRadius = circleHeightConstraint.constant/2
        
        self.circle.layer.borderWidth = 1
        self.circle.layer.borderColor = UIColor.blue.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK :- UITouch delegates
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchPoint = touch.location(in: self.view)
            if self.circleLeadingConstraint != nil {
                self.circleLeadingConstraint.constant = touchPoint.x - self.circleWidthConstraint.constant
                self.circleTopConstraint.constant = touchPoint.y - self.circleHeightConstraint.constant
                self.circle.layer.borderColor = UIColor.blue.cgColor
            }
            break
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if self.circleLeadingConstraint != nil {
                print(touch.force)
                self.circleWidthConstraint.constant += 2 * touch.force
                self.circleHeightConstraint.constant = self.circleWidthConstraint.constant
                self.circle.layer.cornerRadius = circleHeightConstraint.constant/2

            }
            break
        }
    }
    
}

