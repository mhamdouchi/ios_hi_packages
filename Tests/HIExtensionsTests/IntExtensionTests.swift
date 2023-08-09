//
//  IntExtensionTests.swift
//  
//
//  Created by Mohamed Hamdouchi on 8/9/23.
//

@testable import HIExtensions

import XCTest

final class IntExtensionTests: XCTestCase {
    func testFormatNumberDefaultSeparator() {
        let number = 1234567890
        let formatted = number.formatNumber()

        XCTAssertEqual(formatted, "1,234,567,890")
    }
    
    func testFormatNumberCustomSeparator() {
        let number = 987654321
        let formatted = number.formatNumber("-")

        XCTAssertEqual(formatted, "987-654-321")
    }
    
    func testFormatNegativeNumber() {
        let number = -12345
        let formatted = number.formatNumber()

        XCTAssertEqual(formatted, "-12,345")
    }
    
    func testFormatZero() {
        let number = 0
        let formatted = number.formatNumber()

        XCTAssertEqual(formatted, "0")
    }
    
    func testFormatLargeNumberWithCustomSeparator() {
        let number = 1234567890123456
        let formatted = number.formatNumber("_")

        XCTAssertEqual(formatted, "1_234_567_890_123_456")
    }
}
