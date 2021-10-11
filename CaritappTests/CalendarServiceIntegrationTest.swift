//
//  DonationServiceIntegrationTests.swift
//  CaritappTests
//
//  Created by user193919 on 10/9/21.
//

import XCTest

@testable import Caritapp

class CalendarServiceIntegrationTest: XCTestCase {
    let calendarService = CalendarService()

    func testRetrieveCalendar() throws {
        // When
        let calendarExpectation = expectation(description: "Calendar Retrieved")
        calendarService.retrieveCalendar() {
            (donation) in
            //print("Test retrieveDonation")
            //print(donation)
            //XCTAssertEqual(donation.donador, "Walmart")
            //XCTAssertEqual(donation.tienda, "Juventud")
            //XCTAssertEqual(donation.kilos, 15.2)
            
            calendarExpectation.fulfill()
            
            
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
