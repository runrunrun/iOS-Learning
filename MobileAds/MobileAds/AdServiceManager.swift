//
//  AdServiceManager.swift
//  MobileAds
//
//  Created by Hari Kunwar on 2/8/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit

/// AdServiceManager communicates with ad service apis.

protocol AdServiceManager {
    var request: AdRequestProtocol? {set get}
    func loadAdRequest(request: AdRequestProtocol, completion: ((success: Bool, adView: UIView, error: ErrorType) -> Void)!)
}
