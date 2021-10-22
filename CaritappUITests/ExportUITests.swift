//
//  ExportUITests.swift
//  CaritappUITests
//
//  Created by user193919 on 10/21/21.
//

import XCTest

class ExportUITests: XCTestCase {

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
    
    func testExport() {
        // Given
        let app = XCUIApplication()
        app.launch()
        
        // When

        // Go to export view
        let gotoExportButton = app.buttons["Exportar Donacion"]
        gotoExportButton.tap()
        let label = app.staticTexts["title"]
        let exists = NSPredicate(format: "exists == 1")
        expectation(for: exists, evaluatedWith: label, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        
        // Assert correct label values
        let donadorValueLabel = app.staticTexts["donadorValueLabel"]
        XCTAssertEqual(donadorValueLabel.value  as! String, "Prueba1")
    }

}
