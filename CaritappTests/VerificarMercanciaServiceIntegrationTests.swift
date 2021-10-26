//
//  VerificarMercanciaTests.swift
//  CaritappTests
//
//  Created by user189928 on 10/24/21.
//

import XCTest
@testable import Caritapp

class VerificarMercanciaServiceIntegration: XCTestCase {
    let verificarMercanciaService = VerificarMercanciaService()
    
    func testRetrieveDonations() throws {
        // When
        let retrieveDonationsExpectation = expectation(description: "Donations retrieved")
        verificarMercanciaService.retrieveDonations({
            (donations) in
            
            retrieveDonationsExpectation.fulfill()
        })
        
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
    
    func testRetrieveDonationsId() throws {
        // When
        let retrieveDonationsIdExpectation = expectation(description: "Donations IDs retrieved")
        verificarMercanciaService.retrieveDonationsId({
            (donationsIds) in
            
            retrieveDonationsIdExpectation.fulfill()
        })
        
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
    
    func testRetrieveProducts() throws {
        //Given
        let idDonation = "129"
        // When
        let retrieveProductsExpectation = expectation(description: "Products retrieved")
        verificarMercanciaService.retrieveProducts(idDonation: idDonation, {
            (products) in
            
            retrieveProductsExpectation.fulfill()
        })
        
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
    
    func updateProduct() throws {
        
        //Given
        let donation = Donation(donador: "Soriana", tienda: "Jardines", kilos_donados: 67, kilos_recibidos: 0, fecha: "2021-10-15")
        let product = Linea(id: 255, upc: "345679", cant_s: 18, cant_r: 16, precio_unit: 1, precio_tot: 18, donacion: donation)
        
    
        // When
        let updateProductExpectation = expectation(description: "Products retrieved")
        verificarMercanciaService.updateProduct(product: product, {
            (status) in
            
            if(status == 200){
                updateProductExpectation.fulfill()
            }
        })
        
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
