//
//  Creator.swift
//  DesignPatterns
//
//  Created by Hari Kunwar on 7/21/17.
//  Copyright © 2017 learning. All rights reserved.
//

import Foundation

/**
 In software engineering, creational design patterns are design patterns that deal with object creation mechanisms, trying to create objects in a manner suitable to the situation. The basic form of object creation could result in design problems or added complexity to the design. Creational design patterns solve this problem by somehow controlling this object creation.
 */

class Creator {
    let singleton: Singleton
    let car: Vehicle?
    
    init() {
        // Singleton pattern
        self.singleton = Singleton.shared
        
        // Factory pattern
        self.car = VehicleFactory.vehicle(.car)
    }
}
