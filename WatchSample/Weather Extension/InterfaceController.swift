//
//  InterfaceController.swift
//  WatchSample
//
//  Created by Hari Kunwar on 5/23/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        self.presentController([(name: "WeatherInterfaceController", context: 0),
                                (name: "WeatherInterfaceController", context: 1),
                                (name: "WeatherInterfaceController", context: 2),
                                (name: "WeatherInterfaceController", context: 3),
                                (name: "WeatherInterfaceController", context: 4),
                                (name: "WeatherInterfaceController", context: 5),
                                (name: "WeatherInterfaceController", context: 6)])
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
