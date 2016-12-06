//
//  UITestingLoginUITests.swift
//  UITestingLoginUITests
//
//  Created by Hari Kunwar on 12/6/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import XCTest

class UITestingLoginUITests: XCTestCase {
        
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
    
    func testTapLoginButtonWithEmptyFieldsOpensAlert() {
        let userNameTextField = XCUIApplication().textFields["User Name"]
        userNameTextField.tap()
        userNameTextField.typeText("")
        
        let passwordTextField = XCUIApplication().textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("")
        
        let app = XCUIApplication()
        app.buttons["Submit"].tap()
        
        let loginFailedAlert = app.alerts["Login Failed"]

        XCTAssert(loginFailedAlert.staticTexts["Login Failed"].exists)
        XCTAssert(loginFailedAlert.staticTexts["Invalid user name."].exists)

        loginFailedAlert.buttons["OK"].tap()
    }
    
    func testTapLoginButtonWithEmptyUserNameOpensAlert() {
        let userNameTextField = XCUIApplication().textFields["User Name"]
        userNameTextField.tap()
        userNameTextField.typeText("")
        
        let passwordTextField = XCUIApplication().textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("PASSWORDAPP")
        
        let app = XCUIApplication()
        app.buttons["Submit"].tap()
        
        let loginFailedAlert = app.alerts["Login Failed"]
        
        XCTAssert(loginFailedAlert.staticTexts["Login Failed"].exists)
        XCTAssert(loginFailedAlert.staticTexts["Invalid user name."].exists)
        
        loginFailedAlert.buttons["OK"].tap()
    }
    
    func testTapLoginButtonWithShortUserNameOpensAlert() {
        let userNameTextField = XCUIApplication().textFields["User Name"]
        userNameTextField.tap()
        userNameTextField.typeText("USER")
        
        let passwordTextField = XCUIApplication().textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("PASSWORDAPP")
        
        let app = XCUIApplication()
        app.buttons["Submit"].tap()
        
        let loginFailedAlert = app.alerts["Login Failed"]
        
        XCTAssert(loginFailedAlert.staticTexts["Login Failed"].exists)
        XCTAssert(loginFailedAlert.staticTexts["Invalid user name."].exists)
        
        loginFailedAlert.buttons["OK"].tap()
    }
    
    func testTapLoginButtonWithEmptyPasswordOpensAlert() {
        let userNameTextField = XCUIApplication().textFields["User Name"]
        userNameTextField.tap()
        userNameTextField.typeText("APPLESEED")
        
        let passwordTextField = XCUIApplication().textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("")
        
        let app = XCUIApplication()
        app.buttons["Submit"].tap()
        
        let loginFailedAlert = app.alerts["Login Failed"]
        
        XCTAssert(loginFailedAlert.staticTexts["Login Failed"].exists)
        XCTAssert(loginFailedAlert.staticTexts["Invalid password."].exists)
        
        loginFailedAlert.buttons["OK"].tap()
    }
    
    func testTapLoginButtonWithShortPasswordOpensAlert() {
        let userNameTextField = XCUIApplication().textFields["User Name"]
        userNameTextField.tap()
        userNameTextField.typeText("APPLESEED")
        
        let passwordTextField = XCUIApplication().textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("PASS")
        
        let app = XCUIApplication()
        app.buttons["Submit"].tap()
        
        let loginFailedAlert = app.alerts["Login Failed"]
        
        XCTAssert(loginFailedAlert.staticTexts["Login Failed"].exists)
        XCTAssert(loginFailedAlert.staticTexts["Invalid password."].exists)
        
        loginFailedAlert.buttons["OK"].tap()
    }
    
    func testTapLoginButtonWithValidInputsOpensSuccessScreen() {
        let userNameTextField = XCUIApplication().textFields["User Name"]
        userNameTextField.tap()
        userNameTextField.typeText("APPLESEED")
        
        let passwordTextField = XCUIApplication().textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("PASSWORDAPP")
        
        let app = XCUIApplication()
        app.buttons["Submit"].tap()
        
        XCTAssert(app.navigationBars["Success"].staticTexts["Success"].exists)
    }
}
