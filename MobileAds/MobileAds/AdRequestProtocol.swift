//
//  AdRequest.swift
//  MobileAds
//
//  Created by Hari Kunwar on 2/5/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import Foundation

protocol AdRequestProtocol {
    var adZone: String {set get}
    var params: [String: AnyObject]? {set get}
    init(adZone: String, params:[String: AnyObject])
    init(adZone: String)
}