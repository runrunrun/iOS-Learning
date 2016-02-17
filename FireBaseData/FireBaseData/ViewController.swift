//
//  ViewController.swift
//  FireBaseData
//
//  Created by Hari Kunwar on 2/17/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Create a reference to a Firebase location
        let myRootRef = Firebase(url:"https://learningfirebasedemo.firebaseio.com")
        // Write data to Firebase
        
        myRootRef.observeEventType(.Value, withBlock: { snapshot in
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                let employees = snapshots[0]
                for snap in employees.children.allObjects {
                    print(snap)
                }
            }
            
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

