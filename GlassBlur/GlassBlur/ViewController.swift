//
//  ViewController.swift
//  GlassBlur
//
//  Created by Hari Kunwar on 10/8/15.
//  Copyright (c) 2015 learning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var overlayView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // 1
        let blurEffect = UIBlurEffect(style: .Light)
        // 2
        let blurView = UIVisualEffectView(effect: blurEffect)
        // 3
        blurView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.overlayView.insertSubview(blurView, atIndex: 0)
        
        var constraints = [NSLayoutConstraint]()

        // Center X to overlay view
        constraints.append(NSLayoutConstraint(item: blurView, attribute: .CenterX, relatedBy: .Equal,
            toItem: self.overlayView, attribute: .CenterX, multiplier: 1, constant: 0))
        
        // Center Y to overlay view
        constraints.append(NSLayoutConstraint(item: blurView, attribute: .CenterY, relatedBy: .Equal,
            toItem: self.overlayView, attribute: .CenterY, multiplier: 1, constant: 0))
        
        // Equal height
        constraints.append(NSLayoutConstraint(item: blurView,
            attribute: .Height, relatedBy: .Equal, toItem: self.overlayView,
            attribute: .Height, multiplier: 1, constant: 0))
        
        // Equal width
        constraints.append(NSLayoutConstraint(item: blurView,
            attribute: .Width, relatedBy: .Equal, toItem: self.overlayView,
            attribute: .Width, multiplier: 1, constant: 0))
        
        self.overlayView.addConstraints(constraints)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

