//
//  InterstitialAdView.swift
//  MobileAds
//
//  Created by Hari Kunwar on 2/5/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit

class InterstitialAdView: UIView, AdViewProtocol {
    
    var delegate: AdViewDelegate?
    var animated = false
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func loadAdRequest(request: AdRequest) {
        AdManager().fetchAd(request) { (success, data) -> Void in
            
        }
    }
    
}


