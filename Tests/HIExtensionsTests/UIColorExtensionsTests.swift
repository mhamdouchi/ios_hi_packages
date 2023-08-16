//
//  UIColorExtensionsTests.swift
//
//
//  Created by Mohamed Hamdouchi on 8/9/23.
//

@testable import HIExtensions

import XCTest

final class UIColorExtensionsTests: XCTestCase {
    func testColorWithHexStringValid() {
        let hexString = "#FF0000"
        let color = UIColor.colorWithHexString(hexString)

        XCTAssertNotNil(color, "UIColor should be created with valid hex string")
    }

    func testColorWithHex() {
        let hexValue: UInt64 = 0x00FF00
        let color = UIColor.colorWithHex(hexValue)

        XCTAssertEqual(color, UIColor.green, "UIColor should be green for the given hex value")
    }

    func testColorWithHexAndAlpha() {
        let hexValue: UInt64 = 0x0000FF
        let alpha: CGFloat = 0.5
        let color = UIColor.colorWithHex(hexValue, alphaValue: alpha)

        XCTAssertEqual(color, UIColor.blue.withAlphaComponent(alpha), "UIColor should match blue color with custom alpha")
    }
}
