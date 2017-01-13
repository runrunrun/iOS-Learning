//
//  ViewController.swift
//  BasicAnimation
//
//  Created by Hari Kunwar on 1/13/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        UIView.animate(withDuration: 0.5, delay: 0.4, options: [.repeat, .autoreverse, .curveEaseOut], animations: { 
            self.userNameField.center.x += -10
            self.passwordField.center.x += -10
            // Background color will also animate.
            self.view.backgroundColor = UIColor.red
        }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

