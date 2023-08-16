//
//  UIScrollViewExtensionsTests.swift
//
//
//  Created by Mohamed Hamdouchi on 8/9/23.
//

@testable import HIExtensions

import XCTest

final class UIScrollViewExtensionsTests: XCTestCase {
    func testScrollToRight_withContentSizeLessThanBounds() {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: 100, height: 200)
        scrollView.bounds = CGRect(origin: .zero, size: CGSize(width: 150, height: 100))

        scrollView.scrollToRight(animated: true)

        XCTAssertEqual(scrollView.contentOffset.x, 0)
    }

    func testScrollToRight_withContentSizeGreaterThanBounds() {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: 200, height: 100)
        scrollView.bounds = CGRect(origin: .zero, size: CGSize(width: 150, height: 100))

        scrollView.scrollToRight(animated: true)

        XCTAssertEqual(scrollView.contentOffset.x, 50)
    }

    func testScrollToTop() {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: 100, height: 200)

        scrollView.scrollToTop()

        XCTAssertEqual(scrollView.contentOffset.y, 0)
    }

    func testScrollToBottom() {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: 100, height: 200)
        scrollView.bounds = CGRect(origin: .zero, size: CGSize(width: 100, height: 150))

        scrollView.scrollToBottom()

        XCTAssertEqual(scrollView.contentOffset.y, 50)
    }
}
