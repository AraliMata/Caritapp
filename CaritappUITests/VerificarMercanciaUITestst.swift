//
//  VerificarMercanciaUITestst.swift
//  CaritappUITests
//
//  Created by user189928 on 10/23/21.
//

import XCTest

class VerificarMercanciaUITestst: XCTestCase {
   
    
    func testVerificarMercancia() throws {
        
        //Launch the app
        let app = XCUIApplication()
        app.launch()
        
    
        // Go to ListDonationView Scene
        let gotoHomeButton = app.buttons["Home Banco"]
        gotoHomeButton.tap()
        let gotoVerificarMercanciaButton = app.buttons["Verificar mercancía"]
        gotoVerificarMercanciaButton.tap()
        
        // Wait to change screen
        let label = app.staticTexts["Donador"]
        let exists = NSPredicate(format: "exists == 1")
        expectation(for: exists, evaluatedWith: label, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        
        // Wait to load values
        let notEqualPredicate = NSPredicate(format: "label != %@", "---")
        let serviceExpectation = XCTNSPredicateExpectation(predicate: notEqualPredicate, object: label)
        wait(for: [serviceExpectation], timeout: 10.0)
        
        
        //Select first donation on the table to go to ListProductsView Scene
        app.tables.cells.element(boundBy: 0).tap()
        
        // Wait to change screen
        let aLabel = app.staticTexts["Walmart"]
        let exists2 = NSPredicate(format: "exists == 1")
        expectation(for: exists2, evaluatedWith: aLabel, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        
        // Wait to load values
        let notEqualPredicate2 = NSPredicate(format: "label != %@", "---")
        let serviceExpectation2 = XCTNSPredicateExpectation(predicate: notEqualPredicate2, object: aLabel)
        wait(for: [serviceExpectation2], timeout: 10.0)
        
        
        //Select first product on the table to go to EditProductView Scene
        app.tables.cells.element(boundBy: 1).forceTapElement()
        
        // Wait to change screen
        let bLabel = app.staticTexts["UPC"]
        let exists3 = NSPredicate(format: "exists == 1")
        expectation(for: exists3, evaluatedWith: aLabel, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        
        // Wait to load values
        let notEqualPredicate3 = NSPredicate(format: "label != %@", "---")
        let serviceExpectation3 = XCTNSPredicateExpectation(predicate: notEqualPredicate3, object: bLabel)
        wait(for: [serviceExpectation3], timeout: 10.0)
        
        // Set up variables for labels
        let upcLabel = app.staticTexts["UPC"]
        let cantidadSupuestaLabel = app.staticTexts["Cantidad supuesta"]
        let cantidadRecibidaLabel = app.staticTexts["Cantidad recibida"]
        
        // Assert correct label values
        XCTAssertEqual(upcLabel.label  , "UPC")
        XCTAssertEqual(cantidadSupuestaLabel.label  , "Cantidad supuesta")
        XCTAssertEqual(cantidadRecibidaLabel.label  , "Cantidad recibida")
        
    }

}

extension XCUIElement {
    func forceTapElement() {
        if self.isHittable {
            self.tap()
        }
        else {
            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx: 0.0, dy: 0.0))
            coordinate.tap()
        }
    }
}
