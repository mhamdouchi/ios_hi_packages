//
//  DoubleFormatTests.swift
//
//
//  Created by Mohamed Hamdouchi on 8/9/23.
//

@testable import HIExtensions

import XCTest

final class DoubleFormatTests: XCTestCase {
    func testCurrencyDisplayFormatting() {
        XCTAssertEqual(1_234_567.50.format(with: .currencyDisplay), "$1,234,567.50")
        XCTAssertEqual((-1_234_567.50).format(with: .currencyDisplay), "-$1,234,567.50")
    }

    func testCurrencyInputFormatting() {
        XCTAssertEqual(1_234_567.89.format(with: .currencyInput), "$1,234,567.89")
    }

    func testMinutesSecondsFormatting() {
        XCTAssertEqual(75.0.format(with: .minutesSeconds), "01:15")
    }

    func testNumberFormatting() {
        XCTAssertEqual(1_234_567.89.format(with: .number), "1,234,567.89")
    }

    func testWholeNumberFormatting() {
        XCTAssertEqual(1_234_567.format(with: .number), "1,234,567")
    }

    func testPercentFormatting() {
        XCTAssertEqual(0.1234.format(with: .percent), "0.12%")
    }

    func testPercentInputFormatting() {
        XCTAssertEqual(0.1234.format(with: .percentInput), "0%")
    }

    func testStandardFormatting() {
        XCTAssertEqual(1_234_567.89.format(with: .standard), "1,234,567.88999999")
    }
}
