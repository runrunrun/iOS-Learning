//
//  Meal.swift
//  DesignPatterns
//
//  Created by Hari Kunwar on 7/22/17.
//  Copyright © 2017 learning. All rights reserved.
//

import Foundation

protocol MealPlan {
    var items: [Food] { get }
    var price: Double { get }
    
    func addItem(_ item: Food)
}

class Meal: MealPlan {
    var items: [Food] = []
    var price: Double = 0.0
    
    func addItem(_ item: Food) {
        items.append(item)
        price += item.price
    }
}

