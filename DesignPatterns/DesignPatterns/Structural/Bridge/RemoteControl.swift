//
//  RemoteControl.swift
//  DesignPatterns
//
//  Created by Hari Kunwar on 7/27/17.
//  Copyright © 2017 learning. All rights reserved.
//

import Foundation

// Implementation detail
protocol Switch {
    var appliance: Appliance { get set }
    func turnOn(_ on: Bool)
}

class RemoteControl: Switch {
    let appliance: Appliance
    
    init(appliance: Appliance) {
        self.appliance = appliance
    }
    
    func turnOn(_ on: Bool) {
        if on {
            appliance.run()
        } else {
            appliance.stop()
        }
    }
}
