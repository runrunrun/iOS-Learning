//
//  CreationalPattern.swift
//  DesignPatterns
//
//  Created by Hari Kunwar on 7/21/17.
//  Copyright © 2017 learning. All rights reserved.
//

import Foundation


// In software engineering, creational design patterns are design patterns that deal with object creation mechanisms,
// trying to create objects in a manner suitable to the situation. The basic form of object creation could result in
// design problems or added complexity to the design. Creational design patterns solve this problem by somehow controlling
// this object creation.

class CreationalPattern {
    let singleton: Singleton
    let car: Vehicle?
    
    init() {
        // 💍 Singleton
        // The singleton pattern ensures that only one object of a particular class is ever created. All further references
        // to objects of the singleton class refer to the same underlying instance. There are very few applications,
        // do not overuse this pattern!
        self.singleton = Singleton.shared
        
        // 🏭 Factory Method
        // The factory pattern is used to replace class constructors, abstracting the process of object generation so
        // that the type of the object instantiated can be determined at run-time.
        self.car = VehicleFactory.vehicle(.car)
        
        // 🌰 Abstract Factory
        // The abstract factory pattern is used to provide a client with a set of related or dependant objects.
        // The "family" of objects created by the factory are determined at run-time.
        // - Abstract Factory is a super-factory which creates other factories (Factory of factories).
        let macWindowFactory = GUIBuilder.windowFactory(.mac)
        let macWindow = macWindowFactory.createWindow()
        
        
    }
}
