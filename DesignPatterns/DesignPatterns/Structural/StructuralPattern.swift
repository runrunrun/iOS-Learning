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
    
    init() {
        // 🔌 Adapter
        // The adapter pattern is used to provide a link between two otherwise incompatible types by wrapping the
        // "adaptee" with a class that supports the interface required by the client.
        let laserTarget = LaserTarget(angleHorizontal: 10, angleVertical: 20)
        oldTarget = OldLaserTarget(target: laserTarget)
        
    }
}
