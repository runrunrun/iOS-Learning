//
//  SecondViewController.swift
//  WindowSample
//
//  Created by Hari Kunwar on 5/4/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var statusBarStyle: UIStatusBarStyle = .default
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        view.window?.isHidden = true
    }
}
