//
//  NotificationService.swift
//  ServiceExtension
//
//  Created by Hari Kunwar on 1/7/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UserNotifications

/**
 Service extension lets you customize the content of a remote notification before it is delivered to the user:
 
 Some potential uses of Service Extensions include:
 
 Providing end-to-end encryption of the Remote Notification content.
 Adding attachments to Remote Notifications to enrich them.
 
 Once you have configured your app with a notification service extension, the following process will take place for each notification:
 1 App receives notification.
 2 System creates an instance of your extension class and launches it in the background.
 3 Your extension performs content edits and/or downloads some content.
 4 If your extension takes too long to perform its work, it will be notified and immediately terminated.
 5 Notification is displayed to the user.
 */


class NotificationService: UNNotificationServiceExtension {

    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?

    
    /**
     In this method, you create a new UNNotificationContent object and pass this in as a parameter to the completion
     handler when you're done. This notification content can either be created from scratch or from a mutable copy of 
     the original content. 
     */
    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
        
        if let bestAttemptContent = bestAttemptContent {
            // Modify the notification content here...
            bestAttemptContent.title = " [modified]"
            bestAttemptContent.subtitle = " [modified]"
            bestAttemptContent.body = " [modified]"
            contentHandler(bestAttemptContent)
        }
    }
    
    override func serviceExtensionTimeWillExpire() {
        // Called just before the extension will be terminated by the system.
        // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }

}
