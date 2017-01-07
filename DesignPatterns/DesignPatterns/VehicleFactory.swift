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

    class func createVehicleType(_ type: VehicleType) -> Vehicle? {
        var vehicle: Vehicle?
        switch type {
        case VehicleType.car:
            vehicle = Car() as Vehicle
        case VehicleType.bike:
            vehicle = Bike() as Vehicle
        default:
            vehicle = nil
        }
        
        return vehicle
    }

}