//
//  DateExtensionsTests.swift
//
//
//  Created by Mohamed Hamdouchi on 8/9/23.
//

@testable import HIExtensions

import XCTest

final class DateExtensionsTests: XCTestCase {
    private func dateFromString(_ dateString: String, format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: dateString)
    }

    func testYearsFrom() {
        let baseDate = dateFromString("2020-01-01", format: "yyyy-MM-dd")!
        let targetDate = dateFromString("2023-01-01", format: "yyyy-MM-dd")!

        XCTAssertEqual(targetDate.years(from: baseDate), 3)
    }

    func testMonthsFrom() {
        let baseDate = dateFromString("2020-01-01", format: "yyyy-MM-dd")!
        let targetDate = dateFromString("2021-05-01", format: "yyyy-MM-dd")!

        XCTAssertEqual(targetDate.months(from: baseDate), 16)
    }

    func testWeeksFrom() {
        let baseDate = dateFromString("2020-01-01", format: "yyyy-MM-dd")!
        let targetDate = dateFromString("2020-01-15", format: "yyyy-MM-dd")!

        XCTAssertEqual(targetDate.weeks(from: baseDate), 2)
    }

    func testDaysFrom() {
        let baseDate = dateFromString("2020-01-01", format: "yyyy-MM-dd")!
        let targetDate = dateFromString("2020-01-10", format: "yyyy-MM-dd")!

        XCTAssertEqual(targetDate.days(from: baseDate), 9)
    }

    func testOffsetFrom() {
        let baseDate = dateFromString("2020-01-01 12:00:00", format: "yyyy-MM-dd HH:mm:ss")!
        let targetDate = dateFromString("2023-08-09 14:30:00", format: "yyyy-MM-dd HH:mm:ss")!

        XCTAssertEqual(targetDate.offset(from: baseDate), "3y")
    }

    func testFormat() {
        let testDate = dateFromString("2023-08-09 14:30:00", format: "yyyy-MM-dd HH:mm:ss")!

        XCTAssertEqual(testDate.format(.iso8601WithFraction), "2023-08-09T18:30:00.000Z")
        XCTAssertEqual(testDate.format(.monthDayYear), "Aug. 09, 2023")
        XCTAssertEqual(testDate.format(.timeAmPm), "02:30 PM")
    }

    func testIso8601() {
        let testDate = dateFromString("2023-08-09 14:30:00", format: "yyyy-MM-dd HH:mm:ss")!

        XCTAssertEqual(testDate.format(.iso8601), "2023-08-09T18:30:00Z")
    }

    func testIso8601WithFraction() {
        let testDate = dateFromString("2023-08-09 14:30:00.123", format: "yyyy-MM-dd HH:mm:ss.SSS")!

        XCTAssertEqual(testDate.format(.iso8601WithFraction), "2023-08-09T18:30:00.123Z")
    }
}
