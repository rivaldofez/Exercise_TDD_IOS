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
        } else if (!(sides[0] + sides[1] > sides[2]) && (sides[1] + sides[2] > sides[0]) && (sides[0] + sides[2] > sides[1])){
            throw TriangleError.inequalityInput
        } else {
            return "Segitiga Sembarang"
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
    
    func testDetectRandomTriangle() {
        XCTAssertEqual(try detectTriangle(12, 15, 17), "Segitiga Sembarang")
    }
    
    func testInequalityTriangle(){
        XCTAssertThrowsError(try detectTriangle(4, 1, 2)) { error in
            XCTAssertEqual(error as? TriangleError, TriangleError.inequalityInput)
        }
        
        XCTAssertThrowsError(try detectTriangle(5, 1, 3)) { error in
            XCTAssertEqual(error as? TriangleError, TriangleError.inequalityInput)
        }
    }
}

enum TriangleError: Error {
    case invalidInput
    case inequalityInput
}
