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
        //Given
        let inputFile = "[{\"upc\": \"345678\",\"cantidadSupuesta\": 18,\"cantidadRecibida\": 16,\"precioUnitario\": 1,\"precioTotal\": 18,\"destino\": \"no definido\"},{\"upc\": \"345679\",\"cantidadSupuesta\": 18,\"cantidadRecibida\": 16,\"precioUnitario\": 1,\"precioTotal\": 18, \"destino\": \"no definido\"}]"
            //Agregar status cuando se suban los nuevos cambios del backend
        // When
        let productsExpectation = expectation(description: "ID donation retrieved")
        

        createDonationService.sendProducts(file: inputFile, idDonation: "157") { (respuesta) in
            
            XCTAssertEqual(respuesta, 200)
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


