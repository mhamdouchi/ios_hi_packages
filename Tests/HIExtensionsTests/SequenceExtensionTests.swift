//
//  SequenceExtensionTests.swift
//  
//
//  Created by Mohamed Hamdouchi on 8/9/23.
//

@testable import HIExtensions

import XCTest

final class SequenceExtensionTests: XCTestCase {
    func testGroupBy() {
        let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let grouped = numbers.group(by: { $0 % 2 == 0 ? "even" : "odd" })
        
        XCTAssertEqual(grouped["even"], [2, 4, 6, 8, 10])
        XCTAssertEqual(grouped["odd"], [1, 3, 5, 7, 9])
    }
    
    func testLimit() {
        let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let limited = numbers.limit(5)
        
        XCTAssertEqual(limited, [1, 2, 3, 4, 5])
    }
    
    func testEmptySequence() {
        let emptyArray: [Int] = []
        let emptyGrouped = emptyArray.group(by: { $0 })
        let emptyLimited = emptyArray.limit(5)
        
        XCTAssertTrue(emptyGrouped.isEmpty)
        XCTAssertTrue(emptyLimited.isEmpty)
    }
    
    func testLimitGreaterThanCount() {
        let numbers = [1, 2, 3, 4, 5]
        let limited = numbers.limit(10)
        
        XCTAssertEqual(limited, [1, 2, 3, 4, 5])
    }
}
