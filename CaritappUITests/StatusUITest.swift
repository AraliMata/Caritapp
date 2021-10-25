//
//  StatusUITest.swift
//  CaritappUITests
//
//  Created by user194275 on 10/24/21.
//

import XCTest

class StatusUITest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testEstado(){
        // Given
        
        //Launch the app
        let app = XCUIApplication()
        app.launch()
        
        // Set up variables for labels
        let donadorLabel = app.staticTexts["estadoLabel"]

        // When

        // Go to calendar view
        let gotoHomeButton = app.buttons["Home Banco"]
        gotoHomeButton.tap()
        let gotoRegistrarEstadoButton = app.buttons["Registrar recepcion"]
        gotoRegistrarEstadoButton.tap()
        // Wait to change screen
        let label = app.staticTexts["Estado Donacion"]
        let exists = NSPredicate(format: "exists == 1")
        expectation(for: exists, evaluatedWith: label, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        // Wait to load values
        let notEqualPredicate = NSPredicate(format: "label != %@", "---")
        let serviceExpectation = XCTNSPredicateExpectation(predicate: notEqualPredicate, object: donadorLabel)
        wait(for: [serviceExpectation], timeout: 10.0)
        
    }

}
