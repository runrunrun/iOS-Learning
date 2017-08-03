//
//  Appliance.swift
//  DesignPatterns
//
//  Created by Hari Kunwar on 7/27/17.
//  Copyright © 2017 learning. All rights reserved.
//

import Foundation

// Abstract elements with no implementation details.

protocol Appliance {
    func run()
    func stop()
}

class TV: Appliance {
    func run() {
        print("TV turned on.")
    }
    
    func stop() {
        print("TV turned off.")
    }
}

class Fan: Appliance {
    func run() {
        print("TV turned on.")
    }
    
    func stop() {
        print("TV turned off.")
    }
}
