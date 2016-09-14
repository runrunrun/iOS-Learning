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
    
    @IBAction func animateText(_ sender: AnyObject) {
        if !label.isAnimating {
            label.animateText(animate: true, duration: 5.0, repeated: true)
        }
        else {
            label.animateText(animate: false)
        }
    }
    
    @IBAction func changeText(_ sender: AnyObject) {
        label.text = "Something is wrong right???????????"
    }
    
    @IBAction func changeTextColor(_ sender: AnyObject) {
        label.textColor = UIColor.red
    }
    
}

