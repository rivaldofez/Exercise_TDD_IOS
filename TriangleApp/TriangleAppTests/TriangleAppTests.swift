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
        let sides = [sideA, sideB, sideC].sorted()
        
        for side in sides where side < 1 {
            throw TriangleError.invalidInput
        }
        
        if sides[1] == sides[0] && sides[1] == sides[2] {
            return "Segitiga Sama Sisi"
        } else if sides[0] == sides[1] || sides[1] == sides[2] {
            return "Segitiga Sama Kaki"
        } else {
            return "Bukan Segitiga Sama Sisi dan Segitiga Sama Kaki"
        }
    }
    
    func testDetectEquilateralTriangle() {
        XCTAssertEqual(try detectTriangle(2, 2, 2), "Segitiga Sama Sisi")
    }
    
    func testDetectIsoscelesTriangle(){
        XCTAssertEqual(try detectTriangle(1, 2, 2), "Segitiga Sama Kaki")
        XCTAssertEqual(try detectTriangle(1, 1, 2), "Segitiga Sama Kaki")
          XCTAssertEqual(try detectTriangle(1, 2, 1), "Segitiga Sama Kaki")
          XCTAssertEqual(try detectTriangle(1, 2, 2), "Segitiga Sama Kaki")
          XCTAssertEqual(try detectTriangle(2, 1, 2), "Segitiga Sama Kaki")
    }
}

enum TriangleError: Error {
    case invalidInput
}
