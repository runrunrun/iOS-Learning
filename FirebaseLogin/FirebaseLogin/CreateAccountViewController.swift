//
//  CreateAccountViewController.swift
//  FirebaseLogin
//
//  Created by Hari Kunwar on 2/19/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    @IBAction func registerButtonPressed(sender: AnyObject) {
        let username = userNameField.text
        let email = emailField.text
        let password = passwordField.text
        
        if username != "" && email != "" && password != "" {
            
            DataService.sharedInstance.userService.createUser(email, password: password, withValueCompletionBlock: { (error, result) -> Void in
                
                if error == nil {
                    
                    // Create and Login the New User with authUser
                    DataService.sharedInstance.baseService.authUser(email, password: password, withCompletionBlock: { (err, authData) -> Void in
                        
                        let user = ["provider": authData.provider!, "email": email!, "username": username!]
                        // Seal the deal in DataService.swift.
                        DataService.sharedInstance.createNewAccount(authData.uid, userInfo: user)
                    })
                    
                    // Store uid in user defaults
                    NSUserDefaults.standardUserDefaults().setValue(result ["uid"], forKey: "uid")
                    
                    // Show home screen
                    self.performSegueWithIdentifier("newUserLoggedIn", sender: nil)
                }
                else {
                    print("error creating account \(error)")
                }
                
            })
            
        }
    }

}
