//
//  BundleExtensionTests.swift
//
//
//  Created by Mohamed Hamdouchi on 8/9/23.
//

@testable import HIExtensions

import XCTest

class MockBundle: Bundle {
    static let mockInfoDictionary: [String: Any] = [
        "CFBundleShortVersionString": "1.2.3",
        "CFBundleVersion": "456",
    ]

    override var infoDictionary: [String: Any]? {
        return Self.mockInfoDictionary
    }
}

final class BundleExtensionTests: XCTestCase {
    let mockBundle = MockBundle()

    func testBuildNumber() {
        let buildNumber = mockBundle.buildNumber

        XCTAssertEqual(buildNumber, "456")
    }

    func testVersionNumber() {
        let versionNumber = mockBundle.versionNumber

        XCTAssertEqual(versionNumber, "1.2.3")
    }
}
