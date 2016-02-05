//
//  PhunHomeworkTests.swift
//  PhunHomeworkTests
//
//  Created by Hari Kunwar on 2/4/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import XCTest

class PhunHomeworkTests: XCTestCase {
    
    var mainStoryboard: UIStoryboard!
    var navigationController: UINavigationController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        navigationController = mainStoryboard.instantiateInitialViewController() as! UINavigationController
    }
    
    func testNavigationControllerCreated() {
        XCTAssertNotNil(navigationController, "Initial navigation controller nil")
    }
    
    func testRootViewControllerCreated() {
        let rootViewController = navigationController.topViewController
        XCTAssertNotNil(rootViewController, "Root view controller nil")
    }
    
    
}
