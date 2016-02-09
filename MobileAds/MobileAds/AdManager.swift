//
//  AdManager.swift
//  MobileAds
//
//  Created by Hari Kunwar on 2/5/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import Foundation

protocol AdManager {
    var request: AdRequestProtocol?    
    func loadAdRequest(request: AdRequestProtocol, completion: ((success: Bool, adView: UIView, error: ErrorType) -> Void)!)
    func cancelAdRequest()
}

protocol AdDelegate {
    func adWillLoad()
    func adDidLoad()
    func adDidFailToLoad(error: String)
}