//
//  DataExtensionTests.swift
//
//
//  Created by Mohamed Hamdouchi on 8/9/23.
//

@testable import HIExtensions

import XCTest

final class DataExtensionTests: XCTestCase {
    func testHexString() {
        let testData = Data([0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC])

        XCTAssertEqual(testData.hexString, "123456789abc")
    }

    func testToString() {
        let testString = "Hello, World!"
        let testData = testString.data(using: .utf8)!

        XCTAssertEqual(testData.toString, testString)
    }
}
