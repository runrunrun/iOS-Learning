//
//  Vehicle.swift
//  DesignPatterns
//
//  Created by Hari Kunwar on 2/9/15.
//  Copyright (c) 2015 learning. All rights reserved.
//

import Foundation

enum Direction{
    case Left
    case Right
    case Forward
    case Backward
}

enum EnergySource {
    case Human
    case Animal
    case Fuel
}

enum TransportSurface {
    case Land
    case Water
    case Air
}

protocol Vehicle {
    var numberOfWheels: Int {set get}
    var seats: Int {set get}
    var energySource: EnergySource {set get}
    var transportSurface: TransportSurface {set get}
    
    func start()
    func stop()
    func moveDirection(direction: Direction)
}