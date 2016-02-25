//
//  HomeViewControllerUITests.swift
//  PhunHomework
//
//  Created by Hari Kunwar on 2/23/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import XCTest

class HomeViewControllerUITests: XCTestCase {
    
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
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    // MARK: - Test collection view is visible
    func testCollectionViewExists(){
    
    }
    
    // Test collection view displays all items
    func testCollectionViewDisplaysAllItems() {
    
    }
    
    // Test scrolling collection view
    func testCollectionViewScrolling(){
    
    }
    
    // Test all required items are present in collection view cell
    func testCollectionViewCellIsValid() {
    
    }
    
    // MARK: - Test device orientation changes doesn't crash.
    func testNoCrashOnOrientationChange() {
        
        let readyExpectation = expectationWithDescription("ready")

        XCUIDevice.sharedDevice().orientation = .LandscapeRight
        XCUIDevice.sharedDevice().orientation = .PortraitUpsideDown
        XCUIDevice.sharedDevice().orientation = .LandscapeLeft
        XCUIDevice.sharedDevice().orientation = .Portrait
        readyExpectation.fulfill()

        waitForExpectationsWithTimeout(5) { (error) -> Void in
            XCTAssert(true, "Orientation change didn't cause a crash")
        }
    }
    
    // MARK: - Test user touch actions
    
    func testSegueTriggeredOnTappingCell(){
        let app = XCUIApplication()
        let collectionViewsQuery = app.collectionViews
    collectionViewsQuery.staticTexts["Rebel Forces spotted on Hoth. Quell their rebellion for the Empire."].tap()
        app.navigationBars["PhunHomework.DetailView"].buttons["        "].tap()
    collectionViewsQuery.staticTexts["The Boonta Eve Classic us the largest annual podrace in the galaxy. Held on the planet of Tatooine, it is hosted by the Hutts to commemorate the Boonta's Eve holiday. Located just outside Mos Espa, the Boonta race course starts in the Mos Espa Grand Arena. Bring your podracer and nerves to win"].tap()
    }
    
    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
