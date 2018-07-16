//
//  ViewController.swift
//  NSOperationModules
//
//  Created by Hari Kunwar on 8/8/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var operationQueue = OperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        operationQueue.maxConcurrentOperationCount = 1

        let alertOperation1 = BlockOperation()
        alertOperation1.addExecutionBlock {
            print("1")
        }
        
        let alertOperation2 = BlockOperation()
        alertOperation2.addExecutionBlock {
            print("2")
        }

        let alertOperation3 = BlockOperation()
        alertOperation3.addExecutionBlock {
            print("3")
            let alertOperation1 = AlertOperation(viewController: self)
            self.operationQueue.addOperation(alertOperation1)

        }

        
//         Create alert opertions
//        let alertOperation2 = AlertOperation(viewController: self)
//        let alertOperation3 = AlertOperation(viewController: self)

        // Add dependencies
//        alertOperation2.addDependency(alertOperation1)
//        alertOperation3.addDependency(alertOperation2)
        
        // Add to operation queue
        operationQueue.addOperation(alertOperation1)
        operationQueue.addOperation(alertOperation2)
        operationQueue.addOperation(alertOperation3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

