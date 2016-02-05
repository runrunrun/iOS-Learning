//
//  AdRequest.swift
//  MobileAds
//
//  Created by Hari Kunwar on 2/5/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import Foundation

class AdRequest {
    var adZone = ""
    var params: [String: AnyObject]?
    
    required init(adZone: String, params: [String : AnyObject]) {
        self.adZone = adZone
        self.params = params
    }
    
    required init(adZone: String) {
        self.adZone = adZone
        self.params = nil
    }
    
    
}
