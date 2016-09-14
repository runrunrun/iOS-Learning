//
//  ViewController.swift
//  ScrollingLabel
//
//  Created by Hari Kunwar on 9/13/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: ScrollingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: AnyObject) {
        label.textColor = UIColor.red
        label.animateText(animate: true)

    }

}

