//
//  Bike.swift
//  DesignPatterns
//
//  Created by Hari Kunwar on 2/9/15.
//  Copyright (c) 2015 learning. All rights reserved.
//

import Foundation

class Bike: Vehicle {
    var numberOfWheels = 4
    var seats: Int = 4
    var energySource = EnergySource.Human
    var transportSurface = TransportSurface.Land

    func start() {
        //start car
    }
    
    func stop() {
        //stop car
    }
    
    func moveDirection(direction: Direction) {
        //stir car to direction
    }
}