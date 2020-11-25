//
//  FirebaseLEDTests.swift
//  FirebaseLEDTests
//
//  Created by EricM on 7/23/20.
//  Copyright © 2020 EricM. All rights reserved.
//

import XCTest
@testable import FirebaseLED

class FirebaseLEDTests: XCTestCase {
    
    func testFirebaseAndUI(){
        let dService = DatabaseService.manager.test
        print(dService)
        //XCTAssertEqual(<#T##expression1: Equatable##Equatable#>, <#T##expression2: Equatable##Equatable#>)
    }
    
    var app: XCUIApplication?
    
    func testUI(){
        let app = XCUIApplication()
        app.launch()
//        wait(for: [], timeout: 10)
        let deleteButton = app.buttons["deleteButton"]
        XCTAssert(deleteButton.waitForExistence(timeout: 10))
        deleteButton.tap()
    }
    
    // app code
    

    // test code
//    let app = XCUIApplication()
//    let deleteButton = app.buttons["deleteButton"]

//    override func setUp() {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
