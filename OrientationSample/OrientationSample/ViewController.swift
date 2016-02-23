//
//  ViewController.swift
//  OrientationSample
//
//  Created by Hari Kunwar on 2/23/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    This method is called when the view controller's view's size is changed by its parent (i.e. for the root view controller when its window rotates or is resized).
    
    If you override this method, you should either call super to propagate the change to children or manually forward the change to children.
    */
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        print("changing orientation triggered for ViewController")
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
    }
    
}

