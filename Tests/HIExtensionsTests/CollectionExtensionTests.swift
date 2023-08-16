//
//  CollectionExtensionTests.swift
//
//
//  Created by Mohamed Hamdouchi on 8/9/23.
//

@testable import HIExtensions

import XCTest

final class CollectionExtensionTests: XCTestCase {
    func testSafeSubscriptWithValidIndex() {
        let array = [1, 2, 3, 4, 5]

        XCTAssertEqual(array[safe: 2], 3)
    }

    func testSafeSubscriptWithNegativeIndex() {
        let array = [1, 2, 3, 4, 5]

        XCTAssertNil(array[safe: -1])
    }

    func testSafeSubscriptWithTooLargeIndex() {
        let array = [1, 2, 3, 4, 5]

        XCTAssertNil(array[safe: 10])
    }

    func testSafeSubscriptWithEmptyCollection() {
        let emptyArray: [Int] = []

        XCTAssertNil(emptyArray[safe: 0])
    }

    func testSafeSubscriptWithStrings() {
        let strings = ["apple", "banana", "cherry"]

        XCTAssertEqual(strings[safe: 1], "banana")
    }

    func testSafeSubscriptWithCustomType() {
        struct Person {
            let name: String
        }

        let people = [Person(name: "Alice"), Person(name: "Bob"), Person(name: "Charlie")]

        XCTAssertEqual(people[safe: 2]?.name, "Charlie")
    }
}
