//
//  HomeViewControllerTests.swift
//  PhunHomework
//
//  Created by Hari Kunwar on 2/4/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import XCTest
import UIKit

@testable import PhunHomework

class HomeViewControllerTests: XCTestCase {
    
    var viewControllerUnderTest: HomeViewController!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())

        viewControllerUnderTest = storyboard.instantiateViewControllerWithIdentifier("homeViewController") as! HomeViewController
        
        // Force view to load
        let _ = viewControllerUnderTest.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testViewControllerCreated() {
        XCTAssertNotNil(viewControllerUnderTest, "View controller under test is nil")
    }
    
    func testViewControllerComposedOfCollectionView() {
        let subViews = viewControllerUnderTest.view.subviews
        XCTAssertTrue(subViews.contains(viewControllerUnderTest.collectionView), "ViewController under test is not composed of a UICollectionView");
    }
    
    func testViewControllerConformsToUICollectionViewDataSource() {
        XCTAssert(self.viewControllerUnderTest.respondsToSelector(Selector("collectionView:numberOfItemsInSection:")), "ViewController under test does not implement collectionView:numberOfItemsInSection protocol method")
        XCTAssert(self.viewControllerUnderTest.respondsToSelector(Selector("collectionView:cellForItemAtIndexPath:")), "ViewController under test does not implement collectionView:cellForItemAtIndexPath")
    }
    
    func testApiUrlReturnsData() {
        let readyExpectation = expectationWithDescription("ready")
        WebServiceManager.fetchDataFromUrl(WebServiceManager.phunwareFeedUrl) { (dataArray, error) -> Void in
            XCTAssertNotNil(dataArray)
            XCTAssert(dataArray.count > 0, "Empty data array")
            readyExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(5) { (error) -> Void in
            XCTAssertNil(error)
        }
    }
    
    func testFetchingStarShipData() {
        let readyExpectation = expectationWithDescription("ready")
        WebServiceManager.fetchDataFromUrl(WebServiceManager.phunwareFeedUrl) { (dataArray, error) -> Void in
            for object in dataArray {
                guard let _ = object as? [String: String] else {
                    XCTAssert(true, "Not correct dictionary format")
                    readyExpectation.fulfill()
                    return
                }
            }
            readyExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(5) { (error) -> Void in
            XCTAssertNil(error)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
