//
//  Food.swift
//  DesignPatterns
//
//  Created by Hari Kunwar on 7/22/17.
//  Copyright © 2017 learning. All rights reserved.
//

import Foundation

// Food
protocol Food {
    var name: String { get }
    var price: Double { get }
}

// Burger
class Burger: Food {
    enum BurgerType: String {
        case veggy, chicken, beef
    }
    
    var name: String
    var price: Double
    
    init(type: BurgerType) {
        self.name = type.rawValue + "burger"
        
        var price = 0.0
        switch type {
        case .veggy:
            price = 2
        case .chicken:
            price = 3
        case .beef:
            price = 3
        }
        self.price = price
    }
}

// Cold drink
class ColdDrink: Food {
    enum DrinkType: String {
        case coke, pepsi, drPepper, sprite
    }
    
    enum Size {
        case small, medium, large, extraLarge
    }
    
    let name: String
    let price: Double
    
    init(size: Size) {
        self.name = "cold drink"
        
        var price = 0.0
        switch size {
        case .small:
            price = 1
        case .medium:
            price = 2
        case .large:
            price = 2.5
        case .extraLarge:
            price = 3
        }
        self.price = price
    }
}
