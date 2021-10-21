//
//  LineaServiceIntegrationTests.swift
//  CaritappTests
//
//  Created by user193919 on 10/20/21.
//

import XCTest

@testable import Caritapp

class LineaServiceIntegrationTests: XCTestCase {
    let lineaService = LineaService()

    func testRetrieveProducts() throws {
        // When
        let productExpectation = expectation(description: "Products Retrieved")
        lineaService.retrieveProducts() {
            (products) in

            XCTAssertEqual(products.count, 6)
            print("Number of retrieved products: ", products.count)
            
            productExpectation.fulfill()
            
            
        }
        
        // Then
        waitForExpectations(timeout: 20) {
            (error) in

            if let error = error {
                XCTFail("waitForExpectations errored: \(error)")
            } else {
                XCTAssert(true)
            }
        }
    }

}
