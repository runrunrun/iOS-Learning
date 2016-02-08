//
//  ViewController.swift
//  MobileAdsSample
//
//  Created by Hari Kunwar on 2/8/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit
import MobileAds

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let bannerAdView = BannerAdView(frame: CGRectMake(0, 0, 300, 10))
        bannerAdView.loadAd("", size: BannerAdSize.Normal) { (success, error) -> Void in
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

