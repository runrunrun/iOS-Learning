//
//  AdProtocol.swift
//  MobileAds
//
//  Created by Hari Kunwar on 2/5/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import Foundation

protocol AdProtocol {
    func loadAdRequest(request: AdRequestProtocol)
    func adWillLoad()
    func adDidLoad()
    func adDidFailToLoad(error: String)
}