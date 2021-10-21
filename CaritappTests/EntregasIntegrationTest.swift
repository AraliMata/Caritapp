//
//  EntregasIntegrationTest.swift
//  CaritappTests
//
//  Created by user194078 on 10/20/21.
//

import Foundation
import XCTest

@testable import Caritapp

class EntregasIntegrationTest: XCTestCase {
    let entregasService = EntregasService()
    

    func testRetrieveEntregas() throws {
        // When
        let entregasExpectation = expectation(description: "Entregas Retrieved")
        entregasService.retrieveEntregas() {
            (entregas) in
            //print("Test retrieveDonation")
            //print(donation)
            //XCTAssertEqual(donation.donador, "Walmart")
            //XCTAssertEqual(donation.tienda, "Juventud")
            //XCTAssertEqual(donation.kilos, 15.2)
            
            entregasExpectation.fulfill()
            
            
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

