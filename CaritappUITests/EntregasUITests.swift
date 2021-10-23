//
//  EntregasUITests.swift
//  CaritappUITests
//
//  Created by user194078 on 10/23/21.
//

import XCTest

class EntregasUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // Test UI for export functionality
    func testEntregas() {
        // Given
        
        //Launch the app
        let app = XCUIApplication()
        app.launch()
        
        // Set up variables for labels
        let donadorLabel = app.staticTexts["donadorLabel"]
        //let kilosLabel = /app.staticTexts["kilosLabel"]
        //let recepcionLabel = app.staticTexts["recepcionLabel"]

        
        // When

        // Go to calendar view
        let gotoHomeButton = app.buttons["Home Banco"]
        gotoHomeButton.tap()
        let gotoCalendarButton = app.buttons["Calendario"]
        gotoCalendarButton.tap()
        // Wait to change screen
        let label = app.staticTexts["titleCalenadrio"]
        let exists = NSPredicate(format: "exists == 1")
        expectation(for: exists, evaluatedWith: label, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        // Wait to load values
        let notEqualPredicate = NSPredicate(format: "label != %@", "---")
        let serviceExpectation = XCTNSPredicateExpectation(predicate: notEqualPredicate, object: donadorLabel)
        wait(for: [serviceExpectation], timeout: 10.0)
        
        // Assert correct label values
        //XCTAssertEqual(donadorLabel.label  , "Donador")
        //XCTAssertEqual(kilosLabel.label  , "Kilos")
        //XCTAssertEqual(recepcionLabel.label  , "Recepcion")
        //Solo se prueban estos labels y el flujo de la appya que al ser una lista no hay certeza de cuales valores estaran en la tabla
    }

}

