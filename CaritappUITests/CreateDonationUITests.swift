//
//  CreateDonationUITests.swift
//  CaritappUITests
//
//  Created by user189928 on 10/23/21.
//

import Foundation
import Foundation

import XCTest

class CreateDonationUITests: XCTestCase {

    
    func testCreateDonation(){
        //Launch the app
        let app = XCUIApplication()
        app.launch()
        
        // Set up variables for labels
        let donadorLabel = app.staticTexts["Donador"]
        let tiendaLabel = app.staticTexts["Tienda"]
        let kilosLabel = app.staticTexts["Kilos"]
        let fechaLabel = app.staticTexts["Fecha"]
        
        //Go to CreateDonationView
        let gotoCreateDonationButton = app.buttons["Crear donación"]
        gotoCreateDonationButton.tap()
        
        // Wait to change screen
        let label = app.staticTexts["NuevaDonacion"]
        let exists = NSPredicate(format: "exists == 1")
        expectation(for: exists, evaluatedWith: label, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        
        // Wait to load values
        let notEqualPredicate = NSPredicate(format: "label != %@", "---")
        let serviceExpectation = XCTNSPredicateExpectation(predicate: notEqualPredicate, object: donadorLabel)
        wait(for: [serviceExpectation], timeout: 10.0)
        
        // Assert correct label values
        XCTAssertEqual(donadorLabel.label  , "Donador")
        XCTAssertEqual(tiendaLabel.label  , "Tienda")
        XCTAssertEqual(kilosLabel.label  , "Kilos")
        XCTAssertEqual(fechaLabel.label  , "Fecha")
        
        
    }
    
}
