//
//  UIViewExtensionsTests.swift
//
//
//  Created by Mohamed Hamdouchi on 8/9/23.
//

@testable import HIExtensions

import XCTest

final class UIViewExtensionsTests: XCTestCase {
    var testView: UIView!

    override func setUp() {
        super.setUp()
        testView = UIView()
    }

    override func tearDown() {
        testView = nil
        super.tearDown()
    }

    func testGlobalRect() {
        let view = UIView(frame: CGRect(x: 10, y: 20, width: 100, height: 200))
        let superView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 400))

        superView.addSubview(view)

        let globalRect = view.globalRect

        XCTAssertEqual(globalRect?.origin.x, 10)
        XCTAssertEqual(globalRect?.origin.y, 20)
        XCTAssertEqual(globalRect?.size.width, 100)
        XCTAssertEqual(globalRect?.size.height, 200)
    }

    func testAddGradient() {
        let view = UIView()
        let colors: [UIColor] = [.red, .blue, .green]

        view.addGradient(with: colors)

        XCTAssertEqual(view.layer.sublayers?.count, 1)
        XCTAssertTrue(view.layer.sublayers?.first is CAGradientLayer)
    }
}
