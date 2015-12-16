//
//  AppDelegate.swift
//  ShortcutIcon
//
//  Created by Hari Kunwar on 12/15/15.
//  Copyright © 2015 Learning. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var shortcutItem: UIApplicationShortcutItem?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        print("Application did finish launching with options")
        var performShortcutDelegate = true
        
        if let shortcutItem = launchOptions?[UIApplicationLaunchOptionsShortcutItemKey] as? UIApplicationShortcutItem {
            
            print("Application launched via shortcut")
            self.shortcutItem = shortcutItem
            
            performShortcutDelegate = false
        }
        
        return performShortcutDelegate
    }
    
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        
        print("Application performActionForShortcutItem")
        completionHandler( handleShortcut(shortcutItem) )
        
    }
    
    func handleShortcut( shortcutItem:UIApplicationShortcutItem ) -> Bool {
        print("Handling shortcut")
        
        var succeeded = false
        var controller: UIViewController? = nil
        
        var controllerId: String? = nil
        switch shortcutItem.type {
        case "com.learning.viewcontroller1" :
            controllerId = "viewController1"
            
        case "com.learning.viewcontroller2" :
            controllerId = "viewController2"
            
        case "com.learning.viewcontroller3" :
            controllerId = "viewController3"
            
        default:
            print("")
        }
        
        if controllerId != nil {
            controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier(controllerId!)
            succeeded = true
        }

        
        if controller != nil {
            let navVC = self.window?.rootViewController as! UINavigationController
            navVC.pushViewController(controller!, animated: true)
        }

        return succeeded
        
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        print("Application did become active")
        
        guard let shortcut = shortcutItem else { return }
        
        print("- Shortcut property has been set")
        
        handleShortcut(shortcut)
        
        self.shortcutItem = nil
        
    }


}

