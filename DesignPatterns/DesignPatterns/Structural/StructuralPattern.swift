//
//  StructuralPattern.swift
//  DesignPatterns
//
//  Created by Hari Kunwar on 7/26/17.
//  Copyright © 2017 learning. All rights reserved.
//

import Foundation

// In software engineering, structural design patterns are design patterns that ease the design by identifying a simple
// way to realize relationships between entities.
class StructuralPattern {
    let oldTarget: OldLaserTarget
    let tvRemote: RemoteControl
    
    init() {
        // 🔌 Adapter
        // The adapter pattern is used to provide a link between two otherwise incompatible types by wrapping the
        // "adaptee" with a class that supports the interface required by the client.
        let laserTarget = LaserTarget(angleHorizontal: 10, angleVertical: 20)
        oldTarget = OldLaserTarget(target: laserTarget)
        
        // 🌉 Bridge
        // The bridge pattern is used to separate the abstract elements of a class from the implementation details,
        // providing the means to replace the implementation details without modifying the abstraction.
        // We just pass the instance of tv and control it using remote(which contains implementation details)
        tvRemote = RemoteControl(appliance: TV())
        tvRemote.turnOn(true)
        
        // 🌿 Composite
        // The composite pattern is used to create hierarchical, recursive tree structures of related objects where any
        // element of the structure may be accessed and utilised in a standard manner.
        
        // Problem: Application needs to manipulate a hierarchical collection of "primitive" and "composite"
        // objects. Processing of a primitive object is handled one way, and processing of a composite object is
        // handled differently. Having to query the "type" of each object before attempting to process it is not
        // desirable.
        
        // Child management methods [e.g. addChild(), removeChild()] should normally be defined in the Composite
        // class. Unfortunately, the desire to treat Primitives and Composites uniformly requires that these
        // methods be moved to the abstract Component class. See the "Opinions" section below for a discussion of
        // "safety" versus "transparency" issues.
        let whiteboard = Whiteboard(Circle(), Square())
        whiteboard.draw(fillColor: "Red")
        
        // 🍧 Decorator
        // The decorator pattern is used to extend or alter the functionality of objects at run- time by wrapping them
        // in an object of a decorator class. This provides a flexible alternative to using inheritance to modify behaviour.
        
        
        
        
        // 🎁 Façade
        // The facade pattern is used to define a simplified interface to a more complex subsystem.
        
        
        // 🍃 Flyweight
        // The flyweight pattern is used to minimize memory usage or computational expenses by sharing as much as possible
        // with other similar objects.
        
        
        // ☔ Protection Proxy
        // The proxy pattern is used to provide a surrogate or placeholder object, which references an underlying object.
        // Protection proxy is restricting access.
        
        // 🍬 Virtual Proxy
        // The proxy pattern is used to provide a surrogate or placeholder object, which references an underlying object.
        // Virtual proxy is used for loading object on demand.
        

    }
}
