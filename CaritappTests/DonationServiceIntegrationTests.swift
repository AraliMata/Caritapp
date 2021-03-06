//
//  DonationServiceIntegrationTests.swift
//  CaritappTests
//
//  Created by user193919 on 10/9/21.
//

import XCTest

@testable import Caritapp

class DonationServiceIntegrationTest: XCTestCase {
    let donationService = DonationService()

    func testRetrieveDonation() throws {
        // When
        let donationExpectation = expectation(description: "Donation Retrieved")
        donationService.retrieveDonation() {
            (donation) in
            //print("Test retrieveDonation")
            //print(donation)

            XCTAssertEqual(donation.donador, "Prueba1")
            XCTAssertEqual(donation.tienda, "Chida")
            XCTAssertEqual(donation.kilosDonados, 189)
            
            donationExpectation.fulfill()
            
            
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

