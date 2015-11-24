//
//  ThirdViewController.swift
//  AutoLayoutConstraints
//
//  Created by Hari Kunwar on 11/23/15.
//  Copyright © 2015 learning. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    
    override func loadView() {
        super.loadView()
        
        self.view.backgroundColor = UIColor.greenColor()
        
        let view1 = UIView()
        view1.backgroundColor = UIColor.redColor()
        view1.translatesAutoresizingMaskIntoConstraints = false;
        self.view.addSubview(view1)
        
        let view2 = UIView()
        view2.backgroundColor = UIColor.blueColor()
        view2.translatesAutoresizingMaskIntoConstraints = false;
        self.view.addSubview(view2)
        
        
        //make dictionary for views
        let viewsDictionary = [ "view1":view1, "view2":view2]
                
        // Set view1 width and height
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[view1(50)]",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: viewsDictionary))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[view1(50)]",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: viewsDictionary))
    
        
        // Set view1 x and y positions
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-8-[view1]",
            options: NSLayoutFormatOptions.AlignAllLeading,
            metrics: nil,
            views: viewsDictionary))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-8-[view1]",
            options: NSLayoutFormatOptions.AlignAllTop,
            metrics: nil,
            views: viewsDictionary))
        
        
        // Set view2 width and height
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[view2(==view1)]",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: viewsDictionary))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[view2(==view1)]",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: viewsDictionary))
        
        // Set view1 x and y positions
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[view1]-8-[view2]",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: viewsDictionary))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-8-[view2]",
            options: NSLayoutFormatOptions.AlignAllTop,
            metrics: nil,
            views: viewsDictionary))
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
