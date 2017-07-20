//
//  ViewController+Leak.swift
//  LeakyViewController
//
//  Created by Hari Kunwar on 7/19/17.
//  Copyright © 2017 Learning. All rights reserved.
//

import UIKit

extension UIViewController {
    public func assertDealloc(after deadline: TimeInterval = 2.0) {
        let rootViewController = self.parent ?? self
        
        if isMovingFromParentViewController || rootViewController.isBeingDismissed {
            let type = type(of: self)
            let message = isMovingFromParentViewController ? "removed from its parent" : "dismissed"
            
            DispatchQueue.main.asyncAfter(deadline: .now() + deadline, execute: { [weak self] in
                assert(self == nil, "\(type) not deallocated after being \(message)")
            })
        }
    }
    
}
