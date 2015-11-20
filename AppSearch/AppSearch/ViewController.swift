//
//  ViewController.swift
//  AppSearch
//
//  Created by Hari Kunwar on 11/20/15.
//  Copyright © 2015 learning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activity: NSUserActivity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let activity = NSUserActivity(activityType: "com.AppSearch.displayShow")
        activity.title = "Something App search"
        activity.eligibleForHandoff = true
        activity.eligibleForSearch = true
        activity.eligibleForPublicIndexing = true
        activity.userInfo = ["Name": "Something"]
        activity.becomeCurrent()
        
        self.activity = activity
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

