//
//  HomeViewControllerTests.swift
//  PhunHomework
//
//  Created by Hari Kunwar on 2/4/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import XCTest

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
