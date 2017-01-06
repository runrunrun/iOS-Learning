//
//  NotificationScheduler.swift
//  UserNotificationsSample
//
//  Created by Hari Kunwar on 1/6/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import Foundation
import UserNotifications

class NotificationScheduler {
    static let matchNotificationId = "MatchId"
    static let notificationRemindActionId = "remindLater"

    static func scheduleNotification(at date: Date, completionHandler: ((Error?) -> Swift.Void)? = nil) {
        // Get date components
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents(in: .current, from: date)
        let newComponents = DateComponents(calendar: calendar, timeZone: .current, month: components.month, day: components.day, hour: components.hour, minute: components.minute)
        
        // Create notification trigger using date componenets
        let trigger = UNCalendarNotificationTrigger(dateMatching: newComponents, repeats: false)
        
        // Create notification content.
        let content = UNMutableNotificationContent()
        content.title = "Match Reminder"
        content.body = "Watch manchester united game live now."
        content.sound = UNNotificationSound.default()
        
        // Add image to notification content.
        if let path = Bundle.main.path(forResource: "manu", ofType: "jpeg") {
            let url = URL(fileURLWithPath: path)
            do {
                let attachment = try UNNotificationAttachment(identifier: "manuLogo", url: url, options: nil)
                content.attachments = [attachment]
            }
            catch {
                
            }
        }
        
        // Add custom action button to notification.
        content.categoryIdentifier = NotificationScheduler.matchNotificationId
        
        // Create notification request
        let request = UNNotificationRequest(identifier: "textNotification", content: content, trigger: trigger)
        
        // Always remove pending notifications to avoid duplicate notifications.
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
        // Add new notification request.
        UNUserNotificationCenter.current().add(request, withCompletionHandler: completionHandler)
    }

}
