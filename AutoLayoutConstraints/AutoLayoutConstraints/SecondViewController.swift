//
//  SecondViewController.swift
//  AutoLayoutConstraints
//
//  Created by Hari Kunwar on 11/23/15.
//  Copyright © 2015 learning. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

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
        
        /* A constraint is typically installed on the closest common ancestor of the views involved in the constraint.
        It is required that a constraint be installed on _a_ common ancestor of every view involved.  The numbers in a constraint are interpreted in the coordinate system of the view it is installed on.  A view is considered to be an ancestor of itself.
        */
        
        // Width = 100
        self.view.addConstraint(NSLayoutConstraint(item: view1,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1.0,
            constant: 100))
        
        // Height = 100
        self.view.addConstraint(NSLayoutConstraint(item: view1,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1.0,
            constant: 100))
        
        // Leading constraint
        self.view.addConstraint(NSLayoutConstraint(item: view1,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.LeadingMargin,
            multiplier: 1.0,
            constant: 16))
        
        // Center Y constraint
        self.view.addConstraint(NSLayoutConstraint(item: view1,
            attribute: NSLayoutAttribute.CenterY,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.CenterY,
            multiplier: 1.0,
            constant: 0))
        
        let view2 = UIView()
        view2.backgroundColor = UIColor.redColor()
        view2.translatesAutoresizingMaskIntoConstraints = false;
        self.view.addSubview(view2)
        
        // Width = 100
        self.view.addConstraint(NSLayoutConstraint(item: view2,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1.0,
            constant: 100))
        
        // Height = 100
        self.view.addConstraint(NSLayoutConstraint(item: view2,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1.0,
            constant: 100))
        
        // Leading constraint
        self.view.addConstraint(NSLayoutConstraint(item: view2,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view1,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1.0,
            constant: 16))
        
        // Center Y constraint
        self.view.addConstraint(NSLayoutConstraint(item: view2,
            attribute: NSLayoutAttribute.CenterY,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.CenterY,
            multiplier: 1.0,
            constant: 0))
        
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
