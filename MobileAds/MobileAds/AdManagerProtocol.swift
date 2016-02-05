//
//  AdManagerProtocol.swift
//  MobileAds
//
//  Created by Hari Kunwar on 2/5/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import Foundation

protocol AdManagerProtocol {
    func sendAdRequest(request: AdRequestProtocol)
    func cancelAdRequest()
}

protocol AdDelegate {
    func adWillLoad()
    func adDidLoad()
    func adDidFailToLoad(error: String)
}