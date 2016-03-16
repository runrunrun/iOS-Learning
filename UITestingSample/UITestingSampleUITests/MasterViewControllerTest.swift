//
//  MasterViewControllerTest.swift
//  UITestingSample
//
//  Created by Kunwar on 2/13/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import XCTest


class MasterViewControllerTest: XCTestCase {
    
    override func setUp() {
        super.setUp()

        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddingItemsInTableView() {
        let numberOfItems = Int(arc4random_uniform(20))
        let addButton = XCUIApplication().navigationBars["Master"].buttons["Add"]
        for _ in 1...numberOfItems {
            addButton.tap()
        }

    }
    
    func testAllAddedItemsAppearInTableView() {
        let numberOfItems = Int(arc4random_uniform(20))

        let addButton = XCUIApplication().navigationBars["Master"].buttons["Add"]
        for _ in 1...numberOfItems {
            addButton.tap()
        }
        
        // Test added items show in master view controller.
        let table = XCUIApplication().tables.elementBoundByIndex(0)
        let numberOfCell = Int(table.cells.count)
        XCTAssertEqual(numberOfCell, numberOfItems)
    }
    
    func testEditingItemsInTableView() {
        
        let app = XCUIApplication()
        let masterNavigationBar = app.navigationBars["Master"]
        let addButton = masterNavigationBar.buttons["Add"]
        addButton.tap()
        addButton.tap()
        addButton.tap()
        addButton.tap()
        masterNavigationBar.buttons["Edit"].tap()
        
        let tablesQuery2 = app.tables
        let cell = tablesQuery2.childrenMatchingType(.Cell).elementBoundByIndex(0)
        var buttonTitle = "Delete " + cell.title
        cell.buttons[buttonTitle].tap()
        
        
        let deleteButton = tablesQuery2.buttons["Delete"]
        deleteButton.tap()
        
//        let tablesQuery = tablesQuery2
//        tablesQuery.buttons["Delete 2016-02-14 20:49:36 +0000"].tap()
//        deleteButton.tap()
//        cell.buttons["Delete 2016-02-14 20:49:35 +0000"].tap()
//        deleteButton.tap()
//        tablesQuery.buttons["Delete 2016-02-14 20:49:35 +0000"].tap()
//        deleteButton.tap()
        
    }
    
}
