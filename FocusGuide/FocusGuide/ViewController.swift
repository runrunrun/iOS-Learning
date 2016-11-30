//
//  ViewController.swift
//  FocusGuide
//
//  Created by Hari Kunwar on 11/29/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Left edge focus guide
        let leftFocusGuide = UIFocusGuide()
        self.view.addLayoutGuide(leftFocusGuide)
        var tag = 3
        if let button = self.view.viewWithTag(tag) {
            leftFocusGuide.widthAnchor.constraint(equalTo: button.widthAnchor).isActive = true
            leftFocusGuide.heightAnchor.constraint(equalTo: button.heightAnchor).isActive = true
            leftFocusGuide.leadingAnchor.constraint(equalTo: button.trailingAnchor, constant: 60).isActive = true
            leftFocusGuide.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
            if let nextButton = self.view.viewWithTag(tag + 1) {
                leftFocusGuide.preferredFocusEnvironments = [nextButton]
            }
        }
        
        // Right edge focus guide
        let rightFocusGuide = UIFocusGuide()
        self.view.addLayoutGuide(rightFocusGuide)
        tag = 4
        if let button = self.view.viewWithTag(tag) {
            rightFocusGuide.widthAnchor.constraint(equalTo: button.widthAnchor).isActive = true
            rightFocusGuide.heightAnchor.constraint(equalTo: button.heightAnchor).isActive = true
            rightFocusGuide.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -60).isActive = true
            rightFocusGuide.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
            if let nextButton = self.view.viewWithTag(tag - 1) {
                rightFocusGuide.preferredFocusEnvironments = [nextButton]
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func shouldUpdateFocus(in context: UIFocusUpdateContext) -> Bool {
        var updateFocus = true
        if context.focusHeading == .down || context.focusHeading == .up {
            updateFocus = false
        }
        return updateFocus
    }
    
}

