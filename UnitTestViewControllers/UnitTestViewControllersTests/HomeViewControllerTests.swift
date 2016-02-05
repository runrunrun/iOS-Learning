//
//  HomeViewControllerTests.swift
//  UnitTestViewControllers
//
//  Created by Hari Kunwar on 2/4/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import XCTest

@testable import UnitTestViewControllers


class HomeViewControllerTests: XCTestCase {
    
    var viewController: HomeViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        viewController = navigationController.topViewController as! HomeViewController
        
        // Trigger viewController viewDidLoad function
        let _ = viewController.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHomeViewControllerCreated() {
        XCTAssertNotNil(viewController, "HomeViewController is nil")
    }
    
    func testTableViewCreated() {
        XCTAssertNotNil(viewController.tableView, "HomeViewController is nil")
    }
    
    func testTableViewDelegateSet() {
        XCTAssertNotNil(viewController.tableView.delegate, "Table view delegate is nil")
    }
    
    func testTableViewDataSourceSet() {
        XCTAssertNotNil(viewController.tableView.delegate, "Table view datasource is nil")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
