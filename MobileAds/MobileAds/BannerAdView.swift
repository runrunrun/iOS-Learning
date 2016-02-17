//
//  BannerAdView.swift
//  MobileAds
//
//  Created by Hari Kunwar on 2/5/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit

/**
 Banner ad size.
 
 - Normal: For streets or trails.
 - Medium: For long journeys.
 - Large: For casual trips around town.
 */
public enum BannerAdSize : Int {
    case Normal, Medium, Large
}

/// BannerAdView a view for showing banner ads.

public class BannerAdView: UIView, AdView {
    
    /// Optional delegate var to monitor adView lifecycle events.
    public var delegate: AdViewDelegate?
    
    /// Banner view fade in animation.
    var animated = false

    /// Ad view inside BannerAdView
    private var adWebView: UIWebView = UIWebView()
    
    /// Banner ad content provider that providers content to adView webView
    private var adManager: AdManagerProtocol?
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        adManager = BannerAdManager()
    }
    
}

extension BannerAdView : AdManagerProtocol {

    /**
     Load a banner ad with given id and size.
     
     - Parameters:
     - adId: Banner ad identifier
     - size: Banner ad size
     */
    
    public func loadAd(adId: String, size: BannerAdSize) {
        self.loadAd(adId, size: size, completion: nil)
    }
    
    /**
     Load a banner ad with given id and size.
     
     - Parameters:
     - adId: Banner ad identifier
     - size: Banner ad size
     - completion: Load request completion handler
     */
    public func loadAd(adId: String, size: BannerAdSize, completion: ((success: Bool, error: ErrorType) -> Void)!) {
        /// Call loadAdRequest passing an adRequest instance
        self.loadAdRequest(AdRequest(adId: adId)) { (success, error) -> Void in
            completion(success: success, error: error)
        }
    }
    
    /**
     Load a banner ad using banner an ad request. AdRequest is used to provide advanced ad settings.
     
     - Parameters:
     - request: AdRequest instance with advanced ads settings.
     - completion: Ad load request completion handler
     */
    public func loadAdRequest(request: AdRequest, completion: ((success: Bool, error: ErrorType) -> Void)!) {
        AdManager.sharedInstance.fetchAd(request) { (success, content) -> Void in
            // Parse content to get html
            // Load html in adWebView
        }
    }
    
    /// Cancel ad load request
    func cancelAdRequest() {
    
    }

}
