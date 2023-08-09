//
//  UILabelExtensionTests.swift
//  
//
//  Created by Mohamed Hamdouchi on 8/9/23.
//

@testable import HIExtensions

import XCTest

final class UILabelExtensionTests: XCTestCase {
    var label: UILabel!
    
    override func setUp() {
        super.setUp()

        label = UILabel()
    }
    
    override func tearDown() {
        label = nil

        super.tearDown()
    }

    func testSetCustomText() {
        label.setCustomText([("Hello", .light(16.0)), (" World", .bold(18.0))])

        let expectedAttributedString = NSMutableAttributedString()
        expectedAttributedString.append(NSAttributedString(string: "Hello", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0, weight: .light)]))
        expectedAttributedString.append(NSAttributedString(string: " World", attributes: [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBold", size: 18.0) ?? UIFont.boldSystemFont(ofSize: 18.0)]))
        
        XCTAssertEqual(label.attributedText, expectedAttributedString)
    }
    
    func testSetHighlighted() {
        label.setHighlighted("Hello World", with: "World")

        let expectedAttributedString = NSMutableAttributedString(string: "Hello World")
        let range = NSRange(location: 6, length: 5)
        let highlightedAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.backgroundColor: UIColor.systemYellow]

        expectedAttributedString.addAttributes(highlightedAttributes, range: range)
        
        XCTAssertEqual(label.attributedText, expectedAttributedString)
    }
    
    func testSetHighlightedWithColors() {
        label.setHighlighted("Hello World", with: "World", lightColor: .systemGreen, darkColor: .systemBlue)
        
        let expectedAttributedString = NSMutableAttributedString(string: "Hello World")
        let range = NSRange(location: 6, length: 5)
        let highlightColor = label.traitCollection.userInterfaceStyle == .light ? UIColor.systemGreen : UIColor.systemBlue
        let highlightedAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.backgroundColor: highlightColor]
        
        expectedAttributedString.addAttributes(highlightedAttributes, range: range)
        
        XCTAssertEqual(label.attributedText, expectedAttributedString)
    }
}
