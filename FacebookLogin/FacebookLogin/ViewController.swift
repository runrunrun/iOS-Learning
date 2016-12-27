//
//  ViewController.swift
//  FacebookLogin
//
//  Created by Hari Kunwar on 2/23/15.
//  Copyright (c) 2015 learning. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FBLoginViewDelegate {

    @IBOutlet weak var profilePictureView: FBProfilePictureView!
    @IBOutlet weak var loginView: FBLoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: FBLoginViewDelegate
    func loginViewFetchedUserInfo(loginView: FBLoginView!, user: FBGraphUser!) {
        profilePictureView.profileID = user.objectID
    }
    
    func loginViewShowingLoggedOutUser(loginView: FBLoginView!) {
        profilePictureView.profileID = nil
    }
}


