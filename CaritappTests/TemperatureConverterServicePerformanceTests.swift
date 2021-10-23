//
//  CalendarPerformanceTest.swift
//  CaritappTests
//
//  Created by user194078 on 10/23/21.
//

import Foundation

import XCTest

@testable import Caritapp

class TemperatureConverterServicePerformanceTests: XCTestCase {
    let calendarService = CalendarService()

    func testRetrieveCalendar() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            calendarService.retrieveCalendar(){
                (history) in
            }
        }
    }

}
