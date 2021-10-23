//
//  LineaServiceIntegrationTests.swift
//  CaritappTests
//
//  Created by user193919 on 10/20/21.
//

import XCTest

@testable import Caritapp

class LineaServiceIntegrationTests: XCTestCase {
    // products service
    let lineaService = LineaService()

    // Test for correct retrieval of list of products by donation id
    func testRetrieveProducts() throws {
        // When
        let productExpectation = expectation(description: "Products Retrieved")
        // Call service
        lineaService.retrieveProducts() {
            (products) in

            // Assert that retrieved list is expected size
            XCTAssertEqual(products.count, 10)
            print("Number of retrieved products: ", products.count)
            
            // Fulfill expectation
            productExpectation.fulfill()
        }
        
        // Then
        
        // Wait for possible timeout
        waitForExpectations(timeout: 20) {
            (error) in

            if let error = error {
                XCTFail("waitForExpectations errored: \(error)")
            } else {
                XCTAssert(true)
            }
        }
    }
    
    // Test for correct decodification from json to products list
    func testDecodeProductJsonList() throws {
        // Given
        
        // Json to convert
        let json = """
            [
                {
                    "id": 227,
                    "upc": "189087",
                    "cantidadRecibida": 34.5,
                    "cantidadSupuesta": 34.5,
                    "destino": "No definido",
                    "precioTotal": 40,
                    "precioUnitario": 5,
                    "status": "Recibido",
                    "donation": {
                        "donador": "Prueba1",
                        "tienda": "Chida",
                        "kilosDonados": 189,
                        "kilosRecibidos": 0,
                        "fecha": "2021-10-14"
                    }
                }
            ]
        """.data(using: .utf8)!
        
        // Set up decoder and date formatter
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        // Try to convert to list of products objects
        let products = try decoder.decode([Linea].self, from: json)
        
        // Assert that it object was created correctly
        XCTAssertEqual(products[0].id, 227)
        XCTAssertEqual(products[0].donation?.donador, "Prueba1")
    }

}
