//
//  Movie_DBUITests.swift
//  Movie DBUITests
//
//  Created by Indra on 10/06/20.
//  Copyright © 2020 Indra. All rights reserved.
//

import XCTest

class Movie_DBUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLaunch() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testFetchCategories() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        app.buttons["category"].tap()
        app.buttons["Popular"].tap()
        sleep(5)
        app.buttons["category"].tap()
        app.buttons["Up Coming"].tap()
        sleep(5)
        app.buttons["category"].tap()
        app.buttons["Top Rating"].tap()
        sleep(5)
        app.buttons["category"].tap()
        app.buttons["Now Playing"].tap()
        sleep(5)
    }
    
    func testDetailMovie() throws {
        let app = XCUIApplication()
        app.launch()
        let cellCount = app.tables.cells.count
        XCTAssertTrue(cellCount > 0)
        
        let firstCell = app.tables.cells.element(boundBy: 0)
        XCTAssertTrue(firstCell.exists)
        firstCell.tap()
        app.swipeUp()
        app.navigationBars.buttons.element(boundBy: 0).tap()
        sleep(5)
    }
    
    func testFavouriteList() throws {
        let app = XCUIApplication()
        app.launch()
        let cellCount = app.tables.cells.count
        XCTAssertTrue(cellCount > 0)
        
        let firstCell = app.tables.cells.element(boundBy: 0)
        XCTAssertTrue(firstCell.exists)
        firstCell.tap()
        
        app.buttons["heart"].tap()
        app.navigationBars.buttons.element(boundBy: 0).tap()
        app.buttons["heart"].tap()
        sleep(5)
    }
    
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
