//
//  SecondViewController.swift
//  LeakyViewController
//
//  Created by Hari Kunwar on 7/19/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    private var thirdViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // Assert that this viewController is deallocated.
        self.assertDealloc()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Keeping strong reference to viewController
        thirdViewController = segue.destination
    }
}
