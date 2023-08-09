//
//  UITextFieldExtensionTests.swift
//  
//
//  Created by Mohamed Hamdouchi on 8/9/23.
//

@testable import HIExtensions

import XCTest

final class UITextFieldExtensionTests: XCTestCase {
    func testAddInputAccessoryButton() {
        let textField = UITextField()
        let title = "Done"
        let target = NSObject()
        let selector = #selector(selectorMethod)
        
        textField.addInputAccessoryButton(title: title, target: target, selector: selector)
        
        XCTAssertNotNil(textField.inputAccessoryView)
        
        XCTAssertTrue(textField.inputAccessoryView is UIToolbar)
        
        if let toolbar = textField.inputAccessoryView as? UIToolbar {
            XCTAssertEqual(toolbar.items?.count, 2)
            
            if let barButton = toolbar.items?[1] {
                XCTAssertEqual(barButton.title, title)
            } else {
                XCTFail("Bar button item not found")
            }
        } else {
            XCTFail("Input accessory view is not a UIToolbar")
        }
    }
    
    @objc func selectorMethod() {}
}
