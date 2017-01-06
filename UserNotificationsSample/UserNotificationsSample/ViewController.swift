//
//  ViewController.swift
//  UserNotificationsSample
//
//  Created by Hari Kunwar on 1/6/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func scheduleButtonPressed(_ sender: Any) {
        NotificationScheduler.scheduleNotification(at: datePicker.date) { (error) in
            if let error = error {
                print("Uh oh! We had an error: \(error)")
            }
            else {
                // Show success alert.
                let alertController = UIAlertController(title: "Scheduled Notification", message: "Scheduled notification successfully.", preferredStyle: UIAlertControllerStyle.alert)
                
                let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: { (action) in
                    
                })
                alertController.addAction(okAction)
                
                self.present(alertController, animated: true, completion: {
                    
                })
            }
        }
    }
    
}

