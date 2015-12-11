//
//  NSDateExtension.swift
//  PhunHomework
//
//  Created by Hari Kunwar on 12/11/15.
//  Copyright © 2015 Learning. All rights reserved.
//

import Foundation


class DateFormatter {
    static let sharedDateFormatter = NSDateFormatter()
}

extension NSDate {
    
    class func formatDateString(dateString: String) -> String {
        let dateFormatter = DateFormatter.sharedDateFormatter
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        guard let date = dateFormatter.dateFromString(dateString) else {
            print("Invalid date")
            return ""
        }
        dateFormatter.dateFormat = "MMM d, yyyy at h:mm a"
        dateFormatter.AMSymbol = "am"
        dateFormatter.PMSymbol = "pm"
    
        return dateFormatter.stringFromDate(date)
    }
}