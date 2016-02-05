//
//  BannerAdView.swift
//  MobileAds
//
//  Created by Hari Kunwar on 2/5/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit


class BannerAdView: UIView, AdViewProtocol {
    
    var delegate: AdViewDelegate?
    var animated = false
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init() {
        self.init(frame:CGRectZero)
    }
    
    func loadAdRequest(request: AdRequest) {
        
    }

}
