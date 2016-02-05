//
//  HomeContentProviderTests.swift
//  UnitTestViewControllers
//
//  Created by Hari Kunwar on 2/4/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import XCTest

@testable import UnitTestViewControllers

class HomeContentProviderTests: XCTestCase {
    
    var contentProvider: HomeContentProvider!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let viewController = navigationController.topViewController as! HomeViewController
        
        // Trigger viewController viewDidLoad function
        let _ = viewController.view
        
        // Get view controllers content provider
        contentProvider = viewController.contentProvider
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testContentProviderConformsToTableViewDataSourceProtocol() {
        XCTAssert(contentProvider.conformsToProtocol(UITableViewDataSource), "Content provider does not conform to the UITableViewDataSource prototocol")
        
        XCTAssert(contentProvider.respondsToSelector(Selector("tableView:numberOfRowsInSection:")), "Content provider does not implement tableView:numberOfRowsInSection protocol method")
        
        XCTAssert(contentProvider.respondsToSelector(Selector("tableView:cellForRowAtIndexPath:")), "Content provider does not implement tableView:cellForRowAtIndexPath")
    }
    
    func testContentProviderConformsToTableViewDelegateProtocol() {
        XCTAssert(contentProvider.conformsToProtocol(UITableViewDelegate), "ViewController under test does not conform to the UITableViewDelegate protocol.")
    }
    
    func testContentProviderReturnsCorrectSectionCount() {
        XCTAssertEqual(contentProvider.tableView?.numberOfSections, contentProvider.numberOfSections)
    }
    
    func testContentProviderReturnsCorrectRowCount() {
        XCTAssertEqual(contentProvider.tableView?.numberOfRowsInSection(0), contentProvider.numberOfRows)
    }
    
    func testTableCellCreated() {
        let cell  = contentProvider.tableView(contentProvider.tableView!, cellForRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0))
        XCTAssertNotNil(cell)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
