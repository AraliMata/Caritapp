//
//  EntregasServicePerformanceTest.swift
//  CaritappTests
//
//  Created by user194078 on 10/23/21.
//

import XCTest

@testable import Caritapp

class EntregasServicePerformanceTests: XCTestCase {
    let entregasService = EntregasService()

    func testRetrieveEntregas() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            entregasService.retrieveEntregas(){
                (history) in
            }
        }
    }

}
