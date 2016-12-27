//
//  Singleton.swift
//  DesignPatterns
//
//  Created by Hari Kunwar on 2/9/15.
//  Copyright (c) 2015 learning. All rights reserved.
//

import Foundation

//Now that we can declare this shared instance private (as of beta 4), the global will only be available within this file and won’t mess with the global namespace.
private let _sharedInstance = Singleton()

class Singleton {
    
    class var sharedInstance: Singleton {
        return _sharedInstance
    }
    
}