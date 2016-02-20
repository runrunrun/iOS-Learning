//
//  LoginViewController.swift
//  FirebaseLogin
//
//  Created by Hari Kunwar on 2/19/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {


    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if NSUserDefaults.standardUserDefaults().valueForKey("uid") != nil && DataService.sharedInstance.userService.authData != nil {
            self.performSegueWithIdentifier("loggedIn", sender: nil)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // If we have the uid stored, the user is already logger in - no need to sign in again!
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonPressed(sender: AnyObject) {
        
        let email = emailField.text
        let password = passwordField.text
        
        if email != "" && password != "" {
            
            // Login with the Firebase's authUser method
            
            DataService.sharedInstance.baseService.authUser(email, password: password, withCompletionBlock: { error, authData in
                
                if error != nil {
                    print(error)
                } else {
                    // Be sure the correct uid is stored.
                    NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: "uid")
                    
                    // Enter the app!
                    self.performSegueWithIdentifier("loggedIn", sender: nil)
                }
            })
            
        } else {
            
            // There was a problem            
        }

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
