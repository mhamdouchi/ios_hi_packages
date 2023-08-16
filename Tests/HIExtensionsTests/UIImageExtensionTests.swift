//
//  UIImageExtensionTests.swift
//
//
//  Created by Mohamed Hamdouchi on 8/9/23.
//

@testable import HIExtensions

import XCTest

final class UIImageExtensionTests: XCTestCase {
    func testConfigurePointSize() {
        let image = UIImage()
        let configuredImage = image.configurePointSize(.medium)

        XCTAssertNotNil(configuredImage, "Configured image should not be nil")
    }

    func testConfigurePointSizeWithDifferentSizes() {
        let image = UIImage()

        let sizes: [UIImage.PointSize] = [.xxSmall, .xSmall, .small, .medium, .large, .xLarge, .xxLarge]

        for size in sizes {
            let configuredImage = image.configurePointSize(size)

            XCTAssertNotNil(configuredImage, "Configured image for size \(size) should not be nil")
        }
    }
}
