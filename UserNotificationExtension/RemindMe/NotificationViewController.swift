//
//  NotificationViewController.swift
//  RemindMe
//
//  Created by Hari Kunwar on 1/7/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

/**
 It displays custom user interface upon notification expanasion. Below the most important things:
 
 Custom views
 No interaction with views (possible only with notification actions)
 Respond to notification actions (UNNotificationAction)
 */

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet var label: UILabel?
    @IBOutlet weak var manuLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        self.label?.text = notification.request.content.body
    }

    func didReceive(_ response: UNNotificationResponse, completionHandler completion: @escaping (UNNotificationContentExtensionResponseOption) -> Void) {
        print("Cancel called")
        
        if response.actionIdentifier == "cancel" {
            manuLogo.alpha = 0.0
            completion(.dismiss)
        }
        else {
            completion(.doNotDismiss)
        }
    }
}
