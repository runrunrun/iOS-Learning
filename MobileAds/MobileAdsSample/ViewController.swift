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
        let _ = BannerAdView(frame: CGRectMake(0, 0, 300, 10))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

