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
        let donation = Donation(donador: "Prueba1", tienda: "Chida", kilos_donados: 189, kilos_recibidos: 0, fecha: "2021-10-14")
        let product = Linea(id: 227, upc: "189087", cant_s: 34.5, cant_r: 34.5, precio_unit: 5, precio_tot: 40, donacion: donation)
        
    
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
