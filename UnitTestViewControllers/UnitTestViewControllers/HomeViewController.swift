//
//  HomeViewController.swift
//  UnitTestViewControllers
//
//  Created by Hari Kunwar on 2/4/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var contentProvider: HomeContentProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // Create content provider
        contentProvider = HomeContentProvider(tableView: tableView)
        contentProvider?.cellIdentifier = "homeCell"
        
        print("checking")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

