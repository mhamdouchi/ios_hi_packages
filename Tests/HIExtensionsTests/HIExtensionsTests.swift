@testable import HIExtensions
import XCTest

final class HIExtensionsTests: XCTestCase {
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
}
