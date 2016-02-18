//
//  DetailViewControllerTests.swift
//  PhunHomework
//
//  Created by Hari Kunwar on 2/17/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import XCTest

@testable import PhunHomework

class DetailViewControllerTests: XCTestCase {
    
    var viewControllerUnderTest: DetailViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        
        viewControllerUnderTest = storyboard.instantiateViewControllerWithIdentifier("detailViewController") as! DetailViewController
        
        // Force view to load
        let _ = viewControllerUnderTest.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInstatiateViewControllerPerformance() {
        self.measureBlock {
            // Put the code you want to measure the time of here.
            let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            _ = storyboard.instantiateViewControllerWithIdentifier("detailViewController") as! DetailViewController
        }
    }
    
}
