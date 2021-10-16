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
    let fileTool = FileTool()

    func testSendDonation() throws {
        // When
        let donationExpectation = expectation(description: "ID donation retrieved")
        
        createDonationService.sendDonation(donation: Donation(donador: "Alsuper",tienda: "3 culturas",kilos_donados: 40, kilos_recibidos: Float16(0), fecha: "2021-11-2021")) { (idDonation) in
            
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
    
    func testSendProducts() throws{
        // When
        guard let url = URL(string: "file:///Users/user189928/Downloads/products-3.json") else { print("Error: cannot create URL")
            return}
        
        let productsExpectation = expectation(description: "ID donation retrieved")
        let readJson = try fileTool.readFileAsString(url)
        
        createDonationService.sendProducts(file: readJson, idDonation: "126") { (respuesta) in
            XCTAssertEqual(respuesta, "200")
            productsExpectation.fulfill()
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


