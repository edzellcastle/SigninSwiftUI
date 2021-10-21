//
//  SigninSwiftUIUITests.swift
//  SigninSwiftUIUITests
//
//  Created by David Lindsay on 10/15/21.
//

import XCTest

class SigninSwiftUIUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testProfileCreationLabel() throws {
        let app = XCUIApplication()
        app.launch()
        
        let title = app.staticTexts["Profile Creation"]
        let subTitle = app.staticTexts["Use the form below to submit your porfolio.\nAn email and password are required."]
        let field1 = app.staticTexts["First Name"]
        let field2 = app.staticTexts["Email Address"]
        let field3 = app.staticTexts["Password"]
        let field4 = app.staticTexts["Website"]
        
        XCTAssert(title.exists)
        XCTAssert(subTitle.exists)
        XCTAssert(field1.exists)
        XCTAssert(field2.exists)
        XCTAssert(field3.exists)
        XCTAssert(field4.exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
