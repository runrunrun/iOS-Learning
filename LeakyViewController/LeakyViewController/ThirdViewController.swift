//
//  ThirdViewController.swift
//  LeakyViewController
//
//  Created by Hari Kunwar on 7/19/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // Assert that this viewController is deallocated.
        self.assertDealloc()
    }
}
