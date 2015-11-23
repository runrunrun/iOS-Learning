//
//  FirstViewController.swift
//  AutoLayoutConstraints
//
//  Created by Hari Kunwar on 11/23/15.
//  Copyright © 2015 learning. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        
        self.view.backgroundColor = UIColor.greenColor()

        let view1 = UIView()
        view1.backgroundColor = UIColor.redColor()
        /*
        It shuts down the auto resizing mask, which is an automatic way for Xcode to calculate constraints. Xcode has a very bad habit of making far too many constraints, and will cause a run-time error claiming you have too many constraints if you set any constraint programmatically. Set this to false and give yourself total control of the constraints.
        */
        view1.translatesAutoresizingMaskIntoConstraints = false;
        self.view.addSubview(view1)
        
        // Width constraint, half of parent width
        self.view.addConstraint(NSLayoutConstraint(item: view1,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Width,
            multiplier: 0.5,
            constant: 0))
        
        // Height constraint, half of parent height
        self.view.addConstraint(NSLayoutConstraint(item: view1,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Height,
            multiplier: 0.5,
            constant: 0))
        
        // Center X constraint
        self.view.addConstraint(NSLayoutConstraint(item: view1,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1.0,
            constant: 8))
        
        // Center Y constraint
        
        self.view.addConstraint(NSLayoutConstraint(item: view1,
            attribute: NSLayoutAttribute.CenterY,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.CenterY,
            multiplier: 1.0,
            constant: 8))
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
