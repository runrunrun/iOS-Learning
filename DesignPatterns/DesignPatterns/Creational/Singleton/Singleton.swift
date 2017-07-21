//
//  Singleton.swift
//  DesignPatterns
//
//  Created by Hari Kunwar on 2/9/15.
//  Copyright (c) 2015 learning. All rights reserved.
//

import Foundation

// Creational pattern
// Pattern which allows only one instance of a class.
// Used for creating global shared instances like user account.
// Encourages hacks.

class Singleton {
    static let shared = Singleton()
    
    private init() {
        // Private init to prevent initialization.
    }
}
