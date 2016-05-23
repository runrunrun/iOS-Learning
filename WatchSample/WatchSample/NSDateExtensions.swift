//
//  NSDateExtension.swift
//  WatchSample
//
//  Created by Hari Kunwar on 5/19/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import Foundation

extension NSDate {
    func dayOfWeek() -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.stringFromDate(self)
    }
    
}