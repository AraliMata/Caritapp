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
    
    // Test UI for export functionality
    func testExport() {
        // Given
        
        //Launch the app
        let app = XCUIApplication()
        app.launch()
        
        // Set up variables for labels
        let donadorValueLabel = app.staticTexts["donadorValueLabel"]
        let tiendaValueLabel = app.staticTexts["tiendaValueLabel"]
        let fechaValueLabel = app.staticTexts["fechaValueLabel"]
        let kilosDonadosValueLabel = app.staticTexts["kilosDonadosValueLabel"]
        let kilosRecibidosValueLabel = app.staticTexts["kilosRecibidosValueLabel"]
        let destinoValueLabel = app.staticTexts["destinoValueLabel"]
        //let statusSwitch = app.switches["statusSwitch"]
        
        // When

        // Go to export view
        let gotoExportButton = app.buttons["Exportar Donacion"]
        gotoExportButton.tap()
        // Wait to change screen
        let label = app.staticTexts["title"]
        let exists = NSPredicate(format: "exists == 1")
        expectation(for: exists, evaluatedWith: label, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        // Wait to load values
        let notEqualPredicate = NSPredicate(format: "label != %@", "---")
        let serviceExpectation = XCTNSPredicateExpectation(predicate: notEqualPredicate, object: donadorValueLabel)
        wait(for: [serviceExpectation], timeout: 10.0)
        
        // Assert correct label values
        XCTAssertEqual(donadorValueLabel.label  , "Prueba1")
        XCTAssertEqual(tiendaValueLabel.label  , "Chida")
        XCTAssertEqual(fechaValueLabel.label  , "2021-10-14")
        XCTAssertEqual(kilosDonadosValueLabel.label  , "189.0")
        XCTAssertEqual(kilosRecibidosValueLabel.label  , "0.0")
        //XCTAssertEqual(destinoValueLabel.label  , "Central de abastos")
        //XCTAssertEqual(statusSwitch.value  as! Bool, false)
    }

}
