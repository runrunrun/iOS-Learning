//
//  Team.swift
//  KVO-iOS11
//
//  Created by Hari Kunwar on 7/16/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import Foundation

@objcMembers class Team: NSObject {
    let name: String
    let city: String
    let league: String
    
    //The dynamic keyword is required for the observe closure to fire after a value change. Without it, observe will fail silently.
    // BUG: Cannot handle optional values eg. Int?
    dynamic var ranking: Int
    
    init(name: String, city: String, league: String, ranking: Int) {
        self.name = name
        self.city = city
        self.league = league
        self.ranking = ranking
        super.init()
    }
}
