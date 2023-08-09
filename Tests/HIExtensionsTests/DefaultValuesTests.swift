//
//  DefaultValuesTests.swift
//  
//
//  Created by Mohamed Hamdouchi on 8/9/23.
//

@testable import HIExtensions

import XCTest

final class DefaultValuesTests: XCTestCase {
    func testDotString() {
        XCTAssertEqual(kDotString, ".")
    }
    
    func testEmptyString() {
        XCTAssertEqual(kEmptyString, "")
    }
    
    func testEmptyStringSubSequence() {
        XCTAssertTrue(kEmptyStringSubSequence.isEmpty)
    }
    
    func testSpaceString() {
        XCTAssertEqual(kSpaceString, " ")
    }
}
