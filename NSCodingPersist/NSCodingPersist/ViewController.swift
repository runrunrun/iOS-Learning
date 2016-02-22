//
//  ViewController.swift
//  NSCodingPersist
//
//  Created by Hari Kunwar on 2/22/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let savedUser = User.user(forKey: "user1") {
            print(savedUser.firstName)
        }
        
        let user1 = User(firstName: "John", lastName: "K", userId: "johnk", email: "johnk@gmail.com")
        user1.setUser(forKey: "user1")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

