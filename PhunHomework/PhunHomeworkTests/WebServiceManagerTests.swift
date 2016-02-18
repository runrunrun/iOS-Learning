//
//  WebServiceManagerTests.swift
//  PhunHomework
//
//  Created by Hari Kunwar on 2/8/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import XCTest

@testable import PhunHomework

class WebServiceManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testWebServiceCanFetchData() {
        let readyExpectation = expectationWithDescription("ready")
        WebServiceManager.fetchDataFromUrl(WebServiceManager.phunwareFeedUrl) { (dataArray, error) -> Void in
            readyExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(5) { (error) -> Void in
            XCTAssertNil(error)
        }
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testApiResponsePerformance() {
        self.measureBlock {
            // Put the code you want to measure the time of here.
            let readyExpectation = self.expectationWithDescription("ready")
            WebServiceManager.fetchDataFromUrl(WebServiceManager.phunwareFeedUrl) { (dataArray, error) -> Void in
                readyExpectation.fulfill()
            }
            
            self.waitForExpectationsWithTimeout(1000) { (error) -> Void in
                XCTAssertNil(error)
            }
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
