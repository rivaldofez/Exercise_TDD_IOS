//
//  TriangleAppTests.swift
//  TriangleAppTests
//
//  Created by Rivaldo Fernandes on 02/03/23.
//

import XCTest
@testable import TriangleApp

class TriangleAppTests: XCTestCase {
    func testInvalidInputSides() {
        XCTAssertThrowsError(try detectTriangle(-1, 2, 3)) { error in
            XCTAssertEqual(error as? TriangleError, TriangleError.invalidInput)
        }
    }
    
    func detectTriangle(_ sideA: Int, _ sideB: Int, _ sideC: Int) throws -> String {
        for side in [sideA, sideB, sideC] where side < 1 {
            throw TriangleError.invalidInput
        }
        
        if sideA == sideB && sideA == sideC {
            return "Segitiga Sama Sisi"
        } else {
            return "Bukan Segitiga Sama Sisi"
        }
    }
    
    func testDetectEquilateralTriangle() {
        XCTAssertEqual(try detectTriangle(2, 2, 2), "Segitiga Sama Sisi")
    }
    
    func testDetectIsoscelesTriangle(){
        XCTAssertEqual(try detectTriangle(1, 2, 2), "Segitiga Sama Kaki")
    }
}

enum TriangleError: Error {
    case invalidInput
}
