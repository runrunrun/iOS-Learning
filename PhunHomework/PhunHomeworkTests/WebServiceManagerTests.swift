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
    
    let url = "https://dl.dropboxusercontent.com/u/733674/PhunwareHomework/feed.json?dl=1"

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
        WebServiceManager.fetchDataFromUrl(url) { (dataArray, error) -> Void in
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
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
