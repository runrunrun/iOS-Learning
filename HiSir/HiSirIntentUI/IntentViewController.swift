//
//  IntentViewController.swift
//  HiSirIntentUI
//
//  Created by Hari Kunwar on 7/1/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import IntentsUI

// The INUIHostedViewControlling protocol defines methods for presenting a custom interface from Siri or Maps. 
// You adopt this protocol in a view controller, which you then deliver in an Intents UI extension as part of your iOS app.

// This is the UI presented from Siri.

class IntentViewController: UIViewController, INUIHostedViewControlling {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - INUIHostedViewControlling
    
    // Prepare your view controller for the interaction to handle.
    func configure(with interaction: INInteraction!, context: INUIHostedViewContext, completion: ((CGSize) -> Void)!) {
        // Do configuration here, including preparing views and calculating a desired size for presentation.
        
        if let completion = completion {
            completion(self.desiredSize)
        }
    }
    
    var desiredSize: CGSize {
        return self.extensionContext!.hostedViewMaximumAllowedSize
    }
    
}
