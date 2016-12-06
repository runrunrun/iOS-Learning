//
//  ViewController.swift
//  UITestingLogin
//
//  Created by Hari Kunwar on 12/6/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        var performSegue = false

        var errorMessage = ""

        // Check username
        if let userName = userNameField.text {
            performSegue = isValidUserName(userName: userName)
            if performSegue {
                // Check password
                if let password = passwordField.text {
                    performSegue = isValidPassword(password: password)
                    if !performSegue {
                        errorMessage = "Invalid password."
                    }
                }
                else {
                    errorMessage = "Invalid password."
                }
            }
            else {
                errorMessage = "Invalid user name."
            }
        }
        else {
            errorMessage = "Invalid user name."
        }
        
        // Show login alert
        if !performSegue {
            let alertController = UIAlertController(title: "Login Failed", message: errorMessage, preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
                self.dismiss(animated: true, completion: nil)
            })
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: {
            })
        }


        return performSegue
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

    // MARK:- Util
    func isValidUserName(userName: String) -> Bool {
        var isValid = true
        if userName.isEmpty {
            isValid = false
        }
        else if userName.characters.count < 8 {
            isValid = false
        }
        return isValid
    }

    func isValidPassword(password: String) -> Bool {
        var isValid = true
        if password.isEmpty {
            isValid = false
        }
        else if password.characters.count < 8 {
            isValid = false
        }
        return isValid
    }
}

