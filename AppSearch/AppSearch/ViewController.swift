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
        
        /*
        You create a new NSUserActivity object with the unique identifier com.AppSearch.displayShow. Use app bundle identifier to create this.
        */
        let activity = NSUserActivity(activityType: "com.AppSearch.displayShow")
        
        /*
        You give the activity's title property a string value. This is what will show up in the Spotlight search results.
        */
        activity.title = "Something App search"
        
        /*
        To ensure that the content is searchable by more than just its title, you also provide a set of keywords. In the above code snippet, the set of keywords includes each word of the show's name as well as its genre.
        */
        activity.keywords = ["Something", "App"]
        
        /*
        Next, you set a number of properties of the NSUserActivity object to tell the operating system what you want this user activity to be used for. In this tutorial, we are only looking at the search component of the API so we disable Handoff and enable search.
        */
        activity.isEligibleForHandoff = true
        activity.isEligibleForSearch = true
        activity.isEligibleForPublicIndexing = true
        /*
        You then assign a userInfo dictionary to the user activity. This will be used later to restore the state of the application.
        */
        
        activity.userInfo = ["Name": "Something"]
        
        /*
        Finally, you call the becomeCurrent method on the user activity at which point it is automatically added to the device's index of search results.
        */
        activity.becomeCurrent()
        
        self.activity = activity
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

