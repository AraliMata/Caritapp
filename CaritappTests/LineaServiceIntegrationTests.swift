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

            XCTAssertEqual(products.count, 10)
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
    
    func testDecodeProductJsonList() throws {
        // Given
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
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        let products = try decoder.decode([Linea].self, from: json)
                   
        XCTAssertEqual(products[0].id, 227)
        XCTAssertEqual(products[0].donation?.donador, "Prueba1")
    }

}
