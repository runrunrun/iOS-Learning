//
//  ViewController.swift
//  WindowSample
//
//  Created by Hari Kunwar on 5/3/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var window: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func presentButtonPressed(_ sender: Any) {
        window = UIWindow.newWindow(statusBarStyle: .default)
        window?.windowLevel = UIWindowLevelAlert
        window?.isHidden = false
    }

}

