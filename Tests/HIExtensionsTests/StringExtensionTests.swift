//
//  StringExtensionTests.swift
//
//
//  Created by Mohamed Hamdouchi on 8/9/23.
//

@testable import HIExtensions

import XCTest

final class StringExtensionTests: XCTestCase {
    func testStringToBool() {
        XCTAssertTrue("true".toBool)
        XCTAssertFalse("false".toBool)
        XCTAssertFalse("invalid".toBool)
    }

    func testStringToDoubleConversion() {
        XCTAssertEqual("25.5".toDouble, 25.5)
        XCTAssertEqual("25,5".toDouble, 25.5)
        XCTAssertEqual("...,,,25,5,,,".toDouble, 25.5)
        XCTAssertEqual(".25,..".toDouble, 25.0)
        XCTAssertEqual(".25,,,5,..".toDouble, 25.5)
        XCTAssertEqual("25......5".toDouble, 25.5)
        XCTAssertEqual("25.,.,.,5".toDouble, 25.5)
        XCTAssertEqual("2554,55".toDouble, 2554.55)
        XCTAssertEqual("2554.55".toDouble, 2554.55)
    }

    func testStringToInt() {
        XCTAssertEqual("123".toInt, 123)
        XCTAssertEqual("456".toInt, 456)
        XCTAssertNil("invalid".toInt)
    }

    func testStringToData() {
        XCTAssertEqual("test data".toData, "test data".data(using: .utf8))
        XCTAssertEqual("".toData, "".data(using: .utf8))
    }

    func testStringToAlphaNumericsOnly() {
        XCTAssertEqual("Hello123".toAlphaNumericsOnly, "Hello123")
        XCTAssertEqual("Testing!456".toAlphaNumericsOnly, "Testing456")
        XCTAssertEqual("Special^%Chars".toAlphaNumericsOnly, "SpecialChars")
    }

    func testStringToLettersOnly() {
        XCTAssertEqual("Hello123".toLettersOnly, "Hello")
        XCTAssertEqual("Testing!456".toLettersOnly, "Testing")
        XCTAssertEqual("Special^%Chars".toLettersOnly, "SpecialChars")
    }

    func testStringToNumbersOnly() {
        XCTAssertEqual("Hello123".toNumbersOnly, "123")
        XCTAssertEqual("Testing!456".toNumbersOnly, "456")
        XCTAssertEqual("Special^%Chars".toNumbersOnly, "")
    }

    func testStringRemoveSpaces() {
        XCTAssertEqual("Hello World".removeSpaces, "HelloWorld")
        XCTAssertEqual("   Extra   Spaces   ".removeSpaces, "ExtraSpaces")
        XCTAssertEqual("NoSpaces".removeSpaces, "NoSpaces")
    }

    func testStringAddCommas() {
        XCTAssertEqual("Hello World".addCommas(), "Hello World")
        XCTAssertEqual("123".addCommas(), "123")
        XCTAssertEqual("1234".addCommas(), "1,234")
        XCTAssertEqual("1234567890".addCommas(), "1,234,567,890")
    }
    
    func testDoubleToCurrencyConversion() {
        XCTAssertEqual(2500.format(with: .currencyDisplay), "$2,500")
        XCTAssertEqual(25430.format(with: .currencyDisplay), "$25,430")
        XCTAssertEqual(25.00.format(with: .currencyDisplay), "$25")
        XCTAssertEqual(25.01.format(with: .currencyDisplay), "$25.01")
        XCTAssertEqual(25.0.format(with: .currencyDisplay), "$25")
        XCTAssertEqual(25.50.format(with: .currencyDisplay), "$25.50")
        XCTAssertEqual(25.5001.format(with: .currencyDisplay), "$25.50")
        XCTAssertEqual(25678.5001.format(with: .currencyDisplay), "$25,678.50")
        XCTAssertEqual(25.5.format(with: .currencyDisplay), "$25.50")
        XCTAssertEqual(25.000005.format(with: .currencyDisplay), "$25")
        XCTAssertEqual(25.500005.format(with: .currencyDisplay), "$25.50")
        XCTAssertEqual(25.001.format(with: .currencyDisplay), "$25")
        XCTAssertEqual(0.001.format(with: .currencyDisplay), "$0.001")
        XCTAssertEqual(0.219857.format(with: .currencyDisplay), "$0.219857")
        XCTAssertEqual(0.0.format(with: .currencyDisplay), "$0")
        XCTAssertEqual(0.45000000000000284.format(with: .currencyDisplay), "$0.45")
        XCTAssertEqual(3.45000000000000284.format(with: .currencyDisplay), "$3.45")
        XCTAssertEqual(0.00002841.format(with: .currencyDisplay), "$0.00002841")
        XCTAssertEqual((-25430).format(with: .currencyDisplay), "-$25,430")
        XCTAssertEqual((-25430.15).format(with: .currencyDisplay), "-$25,430.15")
    }

    func testDoubleToPercentConversion() {
        XCTAssertEqual(2500.format(with: .percent), "2,500%")
        XCTAssertEqual(25430.format(with: .percent), "25,430%")
        XCTAssertEqual(25.00.format(with: .percent), "25%")
        XCTAssertEqual((-25.00).format(with: .percent), "-25%")
        XCTAssertEqual(25.01.format(with: .percent), "25.01%")
        XCTAssertEqual(25.0.format(with: .percent), "25%")
        XCTAssertEqual(25.50.format(with: .percent), "25.50%")
        XCTAssertEqual(25.5001.format(with: .percent), "25.50%")
        XCTAssertEqual(25678.5001.format(with: .percent), "25,678.50%")
        XCTAssertEqual(25.5.format(with: .percent), "25.50%")
        XCTAssertEqual(25.00000005.format(with: .percent), "25%")
        XCTAssertEqual(25.500000006.format(with: .percent), "25.50%")
        XCTAssertEqual(25.001.format(with: .percent), "25%")
        XCTAssertEqual(0.001.format(with: .percent), "0.01%")
        XCTAssertEqual(0.219857.format(with: .percent), "0.21%")
        XCTAssertEqual(0.0029.format(with: .percent), "0.01%")
        XCTAssertEqual(0.0.format(with: .percent), "0%")
    }

    func testDoubleToStandardConversion() {
        XCTAssertEqual(2500.format(with: .standard), "2,500")
        XCTAssertEqual(25430.format(with: .standard), "25,430")
        XCTAssertEqual(25.00.format(with: .standard), "25")
        XCTAssertEqual(25.01.format(with: .standard), "25.01")
        XCTAssertEqual(25.0.format(with: .standard), "25")
        XCTAssertEqual(25.50.format(with: .standard), "25.50")
        XCTAssertEqual(25.5001.format(with: .standard), "25.5001")
        XCTAssertEqual(25678.5001.format(with: .standard), "25,678.5001")
        XCTAssertEqual(25.5.format(with: .standard), "25.50")
        XCTAssertEqual(25.000005.format(with: .standard), "25.000005")
        XCTAssertEqual(25.500006.format(with: .standard), "25.500006")
        XCTAssertEqual(25.001.format(with: .standard), "25.001")
        XCTAssertEqual(0.001.format(with: .standard), "0.001")
        XCTAssertEqual(0.219857.format(with: .standard), "0.219857")
        XCTAssertEqual(0.0029.format(with: .standard), "0.0029")
        XCTAssertEqual(0.0.format(with: .standard), "0")
    }

    func testIntToOrdinalStringConversion() {
        XCTAssertEqual(1.toOrdinal(), "1st")
        XCTAssertEqual(2.toOrdinal(), "2nd")
        XCTAssertEqual(3.toOrdinal(), "3rd")
        XCTAssertEqual(4.toOrdinal(), "4th")
        XCTAssertEqual(10.toOrdinal(), "10th")
        XCTAssertEqual(11.toOrdinal(), "11th")
        XCTAssertEqual(12.toOrdinal(), "12th")
        XCTAssertEqual(13.toOrdinal(), "13th")
        XCTAssertEqual(14.toOrdinal(), "14th")
        XCTAssertEqual(21.toOrdinal(), "21st")
        XCTAssertEqual(22.toOrdinal(), "22nd")
        XCTAssertEqual(23.toOrdinal(), "23rd")
        XCTAssertEqual(100.toOrdinal(), "100th")
        XCTAssertEqual(1000.toOrdinal(), "1000th")
        XCTAssertEqual(123.toOrdinal(), "123rd")
    }

    func testStringToDate() {
        let dateString = "2023-08-09 12:34:56"
        let date = dateString.toDate

        XCTAssertNotNil(date)

        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date!)

        XCTAssertEqual(components.year, 2023)
        XCTAssertEqual(components.month, 8)
        XCTAssertEqual(components.day, 9)
        XCTAssertEqual(components.hour, 12)
        XCTAssertEqual(components.minute, 34)
        XCTAssertEqual(components.second, 56)
    }

    func testInvalidToDate() {
        let dateString = "invalid-date"
        let date = dateString.toDate

        XCTAssertNil(date)
    }

    func testInvalidISO8601ToDate() {
        let dateString = "invalid-date"
        let date = dateString.iso8601ToDate

        XCTAssertNil(date)
    }

    func testHasNumbersOnly_withNumbersOnly_shouldReturnTrue() {
        XCTAssertTrue("12345".hasNumbersOnly())
    }

    func testHasNumbersOnly_withMixedCharacters_shouldReturnFalse() {
        XCTAssertFalse("abc123".hasNumbersOnly())
    }

    func testHasNumbersOnly_withNoNumbers_shouldReturnFalse() {
        XCTAssertFalse("abcd".hasNumbersOnly())
    }

    func testHasNumbersOnly_withEmptyString_shouldReturnFalse() {
        XCTAssertFalse("".hasNumbersOnly())
    }

    func testHasNumbersOnly_withSpecialCharacters_shouldReturnFalse() {
        XCTAssertFalse("12@34".hasNumbersOnly())
    }

    func testValidUUIDString() {
        XCTAssertTrue("123e4567-e89b-12d3-a456-426655440000".isValidUUIDString())
        XCTAssertTrue("a1b2c3d4-5678-90ab-cdef-1234567890ab".isValidUUIDString())
        XCTAssertTrue("FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF".isValidUUIDString())
    }

    func testInvalidUUIDString() {
        XCTAssertFalse("invalid-uuid-string".isValidUUIDString())
        XCTAssertFalse("123e4567-e89b-12d3-a456-42665544".isValidUUIDString())
        XCTAssertFalse("a1b2c3d4-5678-90ab-cdef-1234567890abc".isValidUUIDString())
        XCTAssertFalse("not-even-close".isValidUUIDString())
    }
}
