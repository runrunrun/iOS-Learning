//
//  VehicleFactory.swift
//  DesignPatterns
//
//  Created by Hari Kunwar on 2/9/15.
//  Copyright (c) 2015 learning. All rights reserved.
//

import Foundation

enum VehicleType {
    case Car
    case Bike
}

class VehicleFactory {

    class func createVehicleType(type: VehicleType) -> Vehicle? {
        var vehicle: Vehicle?
        switch type {
        case VehicleType.Car:
            vehicle = Car() as Vehicle
        case VehicleType.Bike:
            vehicle = Bike() as Vehicle
        default:
            vehicle = nil
        }
        
        return vehicle
    }

}