//
//  Vehicle.swift
//  DesignPatterns
//
//  Created by Hari Kunwar on 2/9/15.
//  Copyright (c) 2015 learning. All rights reserved.
//

import Foundation

enum Direction{
    case left
    case right
    case forward
    case backward
}

enum EnergySource {
    case human
    case animal
    case fuel
}

enum TransportSurface {
    case land
    case water
    case air
}

protocol Vehicle {
    var numberOfWheels: Int {set get}
    var seats: Int {set get}
    var energySource: EnergySource {set get}
    var transportSurface: TransportSurface {set get}
    
    func start()
    func stop()
    func moveDirection(_ direction: Direction)
}
