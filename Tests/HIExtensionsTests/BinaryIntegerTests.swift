//
//  BinaryIntegerTests.swift
//  
//
//  Created by Mohamed Hamdouchi on 8/9/23.
//

@testable import HIExtensions

import XCTest

final class BinaryIntegerTests: XCTestCase {
    func testIsEven() {
        XCTAssertTrue(2.isEven)
        XCTAssertFalse(3.isEven)
        XCTAssertTrue(0.isEven)
        XCTAssertFalse((-1).isEven)
    }
    
    func testIsOdd() {
        XCTAssertFalse(2.isOdd)
        XCTAssertTrue(3.isOdd)
        XCTAssertFalse(0.isOdd)
        XCTAssertTrue((-1).isOdd)
    }
    
    func testToOrdinal() {
        XCTAssertEqual(1.toOrdinal(), "1st")
        XCTAssertEqual(2.toOrdinal(), "2nd")
        XCTAssertEqual(3.toOrdinal(), "3rd")
        XCTAssertEqual(4.toOrdinal(), "4th")
        XCTAssertEqual(11.toOrdinal(), "11th")
        XCTAssertEqual(12.toOrdinal(), "12th")
        XCTAssertEqual(13.toOrdinal(), "13th")
        XCTAssertEqual(21.toOrdinal(), "21st")
        XCTAssertEqual(22.toOrdinal(), "22nd")
        XCTAssertEqual(23.toOrdinal(), "23rd")
    }
}
