//
//  AdManagerProtocol.swift
//  MobileAds
//
//  Created by Hari Kunwar on 2/5/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import Foundation

protocol AdManagerProtocol {
    func loadAd(adId: String, size: BannerAdSize)
    func loadAd(adId: String, size: BannerAdSize, completion: ((success: Bool, error: ErrorType) -> Void)!)
    func loadAdRequest(request: AdRequest, completion: ((success: Bool, error: ErrorType) -> Void)!)
    func cancelAdRequest()
}

protocol AdDelegate {
    func adWillLoad()
    func adDidLoad()
    func adDidFailToLoad(error: String)
}