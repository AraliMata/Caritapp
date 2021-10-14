//
//  ImportFileTool.swift
//  CaritappTests
//
//  Created by user189928 on 10/14/21.
//
@testable import Caritapp
import XCTest

class FileToolTests: XCTestCase {
    let fileTool = FileTool()
    
    func testReadFileAsString() throws {
        //Given
        guard let input = URL(string: "path") else { print("Error: cannot create URL")
            return}
        
        //When
        let result = try fileTool.readFileAsString(input)
        
        //Then
        XCTAssert((result as Any) is String)
    }
   
    func testReadFileAsJson() throws {
        //Given
        guard let input = URL(string: "path") else { print("Error: cannot create URL")
            return}
        
        //When
        let result = try fileTool.readFileAsJson(input)
        
        //Then
        XCTAssert((result as Any) is String) //Que sea tipo JSON
    }

}
