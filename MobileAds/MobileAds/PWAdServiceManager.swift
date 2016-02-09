//
//  PWAdServiceManager.swift
//  MobileAds
//
//  Created by Hari Kunwar on 2/9/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit

/// Load ad request and returns adView.
class PWAdServiceManager: AdServiceManager {
    var request: AdRequestProtocol?
    
    func loadAdRequest(request: AdRequestProtocol, completion: ((success: Bool, adView: UIView, error: ErrorType) -> Void)!) {
    
    }

}
