//
//  BannerAdManager.swift
//  MobileAds
//
//  Created by Hari Kunwar on 2/9/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit

/**
 Requests AdServiceManager for ad content. Uses ad content to build an ad view. 
 Sends created ad view back to BannerAdView. 
 BannerAdView uses created ad view as subview.
 */

class BannerAdManager: AdManager {

    var request: AdRequestProtocol?
    
    func loadAdRequest(request: AdRequestProtocol, completion: ((success: Bool, adView: UIView, error: ErrorType) -> Void)!) {
        
    }
    
    func cancelAdRequest() {
        
    }
    
}
