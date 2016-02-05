//
//  AdView.swift
//  MobileAds
//
//  Created by Hari Kunwar on 2/5/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit

protocol AdViewProtocol {
    var delegate: AdViewDelegate? {get set}
    var animated: Bool {get set}
}

@objc protocol AdViewDelegate {
    optional func adViewWillLoadAd(adView: UIView)
    optional func adViewDidLoadAd(adView: UIView)
    optional func adViewDidAppear(adView: UIView)
    optional func adViewDidFailToLoadAd(adView: UIView)
}
