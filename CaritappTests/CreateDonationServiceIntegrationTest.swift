//
//  DonationServiceIntegrationTests.swift
//  CaritappTests
//
//  Created by Aralí Mata 10/11/21.
//

import XCTest

@testable import Caritapp

class CreateDonationServiceIntegrationTests: XCTestCase {
    let createDonationService = CreateDonationService()

    func testRetrieveDonation() throws {
        // When
        let donationExpectation = expectation(description: "ID donation retrieved")
        
        createDonationService.sendDonation(donation: Donation(donador: "Alsuper",tienda: "3 culturas",kilos_donados: 40, fecha: "2021-11-2021")) { (idDonation) in
            
            XCTAssert((idDonation as Any) is String && idDonation.count  < 5)
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


