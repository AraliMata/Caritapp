//
//   StatusServiceIntegrationTests.swift
//  CaritappTests
//
//
//

import XCTest

@testable import Caritapp

class StatusServiceIntegrationTest: XCTestCase {
    let statusService = StatusService()
    //Prueba para recibir la lista de estados, obtenidos por el id de la donacion
    func testRetrieveStatus() throws {
        // When
        let statusExpectation = expectation(description: "Status Retrieved")
        statusService.retrieveStatus() {
            (status) in
            XCTAssertEqual(status.count, 37)
            print("Number of retrieved status: ", status.count)
            statusExpectation.fulfill()
            
            
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
    
    //Prueba para decodificar un json
    func testDecodeStatusJson() throws{
        // Given
        
        
        let json = """
            [
                {
                    "donacion": {
                        "donador": "Alsuper",
                    "tienda": "3 culturas",
                    "kilosDonados": 40,
                    "kilosRecibidos": 0,
                    "fecha": "2027-05-14"
                    },
                    "estado": "En Tienda",
                    "fecha": "2027-05-14"
                }
            ]
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        // Convierte el json a un status object
        
        let status = try decoder.decode([Status].self, from: json)
        
        // Assert that it object was created correctly
        XCTAssertEqual(status[0].estado, "En Tienda")
        XCTAssertEqual(status[0].donacion?.tienda,"3 culturas" )
        XCTAssertEqual(status[0].fecha, "2027-05-14")
    }

}


