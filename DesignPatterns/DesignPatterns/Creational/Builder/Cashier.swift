//
//  Cashier.swift
//  DesignPatterns
//
//  Created by Hari Kunwar on 7/22/17.
//  Copyright © 2017 learning. All rights reserved.
//

import Foundation

// Builder class
class Cashier {
    
    // Return kids meal
    class func kidsMeal(burgerType: Burger.BurgerType, drink: ColdDrink.DrinkType) -> Meal {
        let burger = Burger(type: burgerType)
        let drink = ColdDrink(size: .small)
        
        let meal = Meal()
        meal.addItem(burger)
        meal.addItem(drink)
        return meal
    }
    
    // Return adult meal
    class func adultMeal(burgerType: Burger.BurgerType, drink: ColdDrink.DrinkType) -> Meal {
        let burger = Burger(type: burgerType)
        let drink = ColdDrink(size: .large)
        
        let meal = Meal()
        meal.addItem(burger)
        meal.addItem(drink)
        return meal
    }
}
