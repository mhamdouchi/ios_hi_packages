//
//  UIAlertControllerExtensionTests.swift
//  
//
//  Created by Mohamed Hamdouchi on 8/9/23.
//

@testable import HIExtensions

import XCTest

final class UIAlertControllerExtensionTests: XCTestCase {
    func testAddActions() {
        let alertController = UIAlertController(title: "Test", message: "Testing", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "Action 1", style: .default, handler: nil)
        let action2 = UIAlertAction(title: "Action 2", style: .cancel, handler: nil)
        let action3: UIAlertAction? = nil
        let action4 = UIAlertAction(title: "Action 4", style: .destructive, handler: nil)
        
        alertController.addActions([action1, action2, action3, action4])
        
        XCTAssertEqual(alertController.actions.count, 3)
        
        XCTAssertEqual(alertController.actions[0].title, "Action 1")
        XCTAssertEqual(alertController.actions[0].style, .default)
        
        XCTAssertEqual(alertController.actions[1].title, "Action 2")
        XCTAssertEqual(alertController.actions[1].style, .cancel)
        
        XCTAssertEqual(alertController.actions[2].title, "Action 4")
        XCTAssertEqual(alertController.actions[2].style, .destructive)
    }
}
