//
//  Coffee.swift
//  DesignPatterns
//
//  Created by Hari Kunwar on 8/4/17.
//  Copyright © 2017 learning. All rights reserved.
//

protocol Coffee {
    func cost() -> Double
    func ingredients() -> String
}

class SimpleCoffee: Coffee {
    func cost() -> Double {
        return 1.0
    }
    
    func ingredients() -> String {
        return "Coffee"
    }
}

// Decorate coffee
class CoffeeDecorator: Coffee {
    private let decoratedCoffee: Coffee
    
    init(decoratedCoffee: Coffee) {
        self.decoratedCoffee = decoratedCoffee
    }
    
    func ingredients() -> String {
        return decoratedCoffee.ingredients()
    }
    
    func cost() -> Double {
        return decoratedCoffee.cost()
    }
}

class Milk: CoffeeDecorator {
    override init(decoratedCoffee: Coffee) {
        super.init(decoratedCoffee: decoratedCoffee)
    }
    
    override func cost() -> Double {
        return super.cost() + 0.7
    }
    
    override func ingredients() -> String {
        return super.ingredients() + ", " + "Milk"
    }
}

class Caramel: CoffeeDecorator {
    override init(decoratedCoffee: Coffee) {
        super.init(decoratedCoffee: decoratedCoffee)
    }
    
    override func cost() -> Double {
        return super.cost() + 1.0
    }
    
    override func ingredients() -> String {
        return super.ingredients() + ", " + "Caramel"
    }
}




