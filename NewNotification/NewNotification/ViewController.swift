//
//  ViewController.swift
//  NewNotification
//
//  Created by Hari Kunwar on 7/6/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get notification center for current application
        let notificationCenter = UNUserNotificationCenter.current()
        
        // Get users authorization for showing alerts, badges and playing sounds.
        notificationCenter.requestAuthorization([.alert, .badge, .sound]) { (success, authError) in
            if (success) {
                // Create notification content and set properties
                let content = UNMutableNotificationContent()
                content.title = "Hello World"
                content.body = "Hello World this is me."
                content.sound = UNNotificationSound.default()
                
                // Create time trigger
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 15, repeats: true)
                
                // Create notification request
                let request = UNNotificationRequest(identifier: "HelloNotification", content: content, trigger: trigger)
                
                // Add notification request to notification center
                notificationCenter.add(request, withCompletionHandler: { (requestError) in
                    if let error = requestError {
                        print("Error occured:" + error.description)
                    }
                })
                
            }
            else if let error = authError {
                print("error occurred:" + error.description);
            }
            else {
                // User did not give authorization
                print("User rejected authorization");
            }
        }
        
        // Get App Notification settings info
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            
            // Notification Access
            if (settings.authorizationStatus == .authorized) {
                print("Notifications authorized access")
            }
            else if (settings.authorizationStatus == .denied) {
                print("Notifications denied access")
            }
            else if (settings.authorizationStatus == .notDetermined) {
                print("Notifications access not determined")
            }
            
            // Sound access
            if (settings.soundSetting == .enabled) {
                print("Notification can play sounds")
            }
            
            // Badge access
            if (settings.badgeSetting == .enabled) {
                print("Notification will show badges")
            }
            
            // Notification styles
            if (settings.alertStyle == .banner) {
                print("Notification will show as banner")
            }
            else if (settings.alertStyle == .alert) {
                print("Notification will show as an alert")
            }
            
            // Lock screen access
            if (settings.lockScreenSetting == .enabled) {
                print("Notification will show in lock screne")
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

