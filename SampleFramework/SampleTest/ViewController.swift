//
//  ViewController.swift
//  SampleTest
//
//  Created by Hari Kunwar on 12/7/15.
//  Copyright (c) 2015 learning. All rights reserved.
//

import UIKit
import SampleFramework

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var custom = CustomView()
        println(custom.sampleString())
        println(custom.sampleTestCount())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

