//
//  UnitTestViewControllersTests.swift
//  UnitTestViewControllersTests
//
//  Created by Hari Kunwar on 2/4/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import XCTest
@testable import UnitTestViewControllers

class UnitTestViewControllersTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let rootViewController = navigationController.topViewController
        
        // Test navigation and root view controller not nil
        XCTAssertNotNil(navigationController, "Initial navigation controller nil")
        XCTAssertNotNil(rootViewController, "Root view controller nil")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
