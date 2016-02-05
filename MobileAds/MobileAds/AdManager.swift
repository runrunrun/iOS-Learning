//
//  AdManager.swift
//  MobileAds
//
//  Created by Hari Kunwar on 2/5/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import Foundation

class AdManager {
    
    func fetchAd(request: AdRequest, completionHandler: (Bool, [AnyObject]) -> Void ) {
        completionHandler(true, ["a"])
    }
    
    func cancelAdRequest() {
    }


}