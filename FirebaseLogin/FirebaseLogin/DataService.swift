//
//  DataService.swift
//  FirebaseLogin
//
//  Created by Hari Kunwar on 2/19/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit
import Firebase

class DataService: NSObject {
    private static let baseUrl = "https://learningfirebasedemo.firebaseio.com"
    static let sharedInstance = DataService()
    var baseService = Firebase(url: baseUrl)
    var userService = Firebase(url: baseUrl+"/users")

    func createNewAccount(userId: String, userInfo: [String: String]){
        userService.childByAppendingPath(userId).setValue(userInfo)
    }
    
}
