//
//  AdView.swift
//  MobileAds
//
//  Created by Hari Kunwar on 2/5/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit

protocol AdView {
    var delegate: AdViewDelegate? {get set}
    var animated: Bool {get set}
}

// Optional delegate methods to monitor adView lifecycle events.
@objc public protocol AdViewDelegate {
    optional func adViewWillLoadAd(adView: UIView)
    optional func adViewDidLoadAd(adView: UIView)
    optional func adViewDidFailToLoadAd(adView: UIView, error: NSError)
    optional func adViewWillPresentModal(adView: UIView)
    optional func adViewDidPresentModal(adView: UIView)
    optional func adViewWillDismissModal(adView: UIView)
    optional func adViewDidDismissModal(adView: UIView)
    optional func adViewWillLeaveApplication(adView: UIView)
}
