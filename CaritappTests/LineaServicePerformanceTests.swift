//
//  LineaServicePerformanceTests.swift
//  CaritappTests
//
//  Created by user193919 on 10/23/21.
//

import XCTest

@testable import Caritapp

class LineaServicePerformanceTests: XCTestCase {
    // products service
    let lineaService = LineaService()
    
    // Test performance of products retrieval
    func testRetrieveProductsPerformance() throws {
        // Measure the performance
        self.measure {
            lineaService.retrieveProducts(){
                (products) in
            }
        }
    }

}
