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
    
    func detectTriangle(_ sideA: Int, _ sideB: Int, _ sideC: Int) throws {
        if sideA < 1 {
           throw TriangleError.invalidInput
        }
    }
}

enum TriangleError: Error {
    case invalidInput
}
