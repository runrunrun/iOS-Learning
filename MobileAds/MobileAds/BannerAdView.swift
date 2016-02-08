//
//  BannerAdView.swift
//  MobileAds
//
//  Created by Hari Kunwar on 2/5/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit


public class BannerAdView: UIView, AdViewProtocol {
    
    var delegate: AdViewDelegate?
    var animated = false
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public func loadAdRequest(request: AdRequest) {
        
    }

}
