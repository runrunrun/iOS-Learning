//
//  AdRequest.swift
//  MobileAds
//
//  Created by Hari Kunwar on 2/5/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import Foundation

public class AdRequest {
    public var adZone = ""
    public var params: [String: AnyObject]?
    
    required public init(adZone: String, params: [String : AnyObject]) {
        self.adZone = adZone
        self.params = params
    }
    
    required public init(adZone: String) {
        self.adZone = adZone
        self.params = nil
    }
    
    
}
