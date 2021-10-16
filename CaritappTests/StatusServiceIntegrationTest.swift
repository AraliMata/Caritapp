//
//  StatusServiceIntegrationTest.swift
//  CaritappTests
//
//  Created by user194275 on 10/9/21.
//

import XCTest

@testable import Caritapp

class StatusServiceIntegrationTests: XCTestCase {
    let statusService = StatusService()

    func testEditStatus() throws {
       
        
        // When
        let statusExpectation = expectation(description: "Status edited")
        
        statusService.editStatus(status: Status(estado: "En camino", fecha: "2021-11-2021" )) {
            (idStatus) in
            
            XCTAssert((idStatus as Any) is String && idStatus.estado == "En camino")
            
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

}


