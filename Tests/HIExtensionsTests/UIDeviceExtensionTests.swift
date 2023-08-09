//
//  UIDeviceExtensionTests.swift
//  
//
//  Created by Mohamed Hamdouchi on 8/9/23.
//

@testable import HIExtensions

import XCTest

final class UIDeviceExtensionTests: XCTestCase {
    func testModelName() {
        let device = UIDevice.current
        let modelName = device.modelName
        
        XCTAssertFalse(modelName.isEmpty, "Model name should not be empty")
    }
    
    func testHasNotch() {
        let hasNotch = UIDevice.hasNotch
        
        XCTAssertTrue(hasNotch || !hasNotch, "hasNotch should be either true or false")
    }
    
    func testVibrate() {
        XCTAssertNoThrow(UIDevice.vibrate(), "Vibration should not throw an error")
    }
    
    func testPlayHapticImpact() {
        XCTAssertNoThrow(UIDevice.playHapticImpact(with: .light), "Haptic impact should not throw an error")
    }
    
    func testPlayHapticFeedback() {
        XCTAssertNoThrow(UIDevice.playHapticFeedback(with: .success), "Haptic feedback should not throw an error")
    }
}
