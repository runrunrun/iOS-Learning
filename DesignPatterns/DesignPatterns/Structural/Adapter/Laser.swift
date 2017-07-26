//
//  Laser.swift
//  DesignPatterns
//
//  Created by Hari Kunwar on 7/26/17.
//  Copyright © 2017 learning. All rights reserved.
//

import Foundation

// New laser target.
// Adaptee
struct LaserTarget {
    let angleHorizontal: Double
    let angleVertical: Double
}


// Old laser target.
// Convert to protocol
protocol OldLaserTargeting {
    var angleV: NSNumber { get }
    var angleH: NSNumber { get }
}

// Adapter
struct OldLaserTarget: OldLaserTargeting {
    private let target: LaserTarget

    var angleV: NSNumber {
        return NSNumber(value: target.angleVertical)
    }
    var angleH: NSNumber {
        return NSNumber(value: target.angleVertical)
    }

    init(target: LaserTarget) {
        self.target = target
    }
}
