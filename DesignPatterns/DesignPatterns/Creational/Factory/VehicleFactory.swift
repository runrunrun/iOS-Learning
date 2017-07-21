//
//  VehicleFactory.swift
//  DesignPatterns
//
//  Created by Hari Kunwar on 2/9/15.
//  Copyright (c) 2015 learning. All rights reserved.
//

import Foundation

enum VehicleType {
    case car
    case bike
}

class VehicleFactory {

    class func vehicle(_ type: VehicleType) -> Vehicle? {
        var vehicle: Vehicle?
        switch type {
        case VehicleType.car:
            vehicle = Car()
        case VehicleType.bike:
            vehicle = Bike()
        }
        
        return vehicle
    }

}
