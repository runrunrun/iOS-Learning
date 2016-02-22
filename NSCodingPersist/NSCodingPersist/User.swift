//
//  User.swift
//  NSCodingPersist
//
//  Created by Hari Kunwar on 2/22/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit

class User: NSObject, NSCoding {

    var firstName: String?
    var lastName: String?
    var userId: String?
    var email: String?
    
    init(firstName: String, lastName: String, userId: String, email: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.userId = userId
        self.email = email
    }
    
    // MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.firstName, forKey: "firstName")
        aCoder.encodeObject(self.lastName, forKey: "lastName")
        aCoder.encodeObject(self.userId, forKey: "userId")
        aCoder.encodeObject(self.email, forKey: "email")
    }
    
    required init?(coder aDecoder: NSCoder){
        self.firstName = aDecoder.decodeObjectForKey("firstName") as? String
        self.lastName = aDecoder.decodeObjectForKey("lastName") as? String
        self.userId = aDecoder.decodeObjectForKey("userId") as? String
        self.email = aDecoder.decodeObjectForKey("email") as? String
    }

    func setUser(forKey key: String) {
        let data = NSKeyedArchiver.archivedDataWithRootObject(self)
        NSUserDefaults.standardUserDefaults().setObject(data, forKey: key)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    class func user(forKey key: String) -> User? {
        var user: User?
        if let data = NSUserDefaults.standardUserDefaults().objectForKey(key) as? NSData {
            user = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? User
        }
        
        return user
    }
}
