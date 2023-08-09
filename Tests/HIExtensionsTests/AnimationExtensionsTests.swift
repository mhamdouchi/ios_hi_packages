//
//  AnimationExtensionsTests.swift
//  
//
//  Created by Mohamed Hamdouchi on 8/9/23.
//

@testable import HIExtensions

import XCTest

final class AnimationExtensionsTests: XCTestCase {
    class MockAnimatableCell: UITableViewCell, AnimatableCell {
        var animateCalled = false
        var animationStyle: AnimationStyle?
        var animationSize: CGSize?
        
        func animate(_ style: AnimationStyle, size: CGSize) {
            animateCalled = true
            animationStyle = style
            animationSize = size
        }
    }
    
    class MockTableView: UITableView {
        var reloadCalled = false
        var animationStyle: AnimationStyle?
        
        override func reloadData() {
            reloadCalled = true
        }
    }
    
    func testAnimateCellHorizontal() {
        let cell = MockAnimatableCell()
        cell.animate(.horizontal, size: CGSize(width: 100, height: 200))
        
        XCTAssertTrue(cell.animateCalled)
        XCTAssertEqual(cell.animationStyle, .horizontal)
        XCTAssertEqual(cell.animationSize, CGSize(width: 100, height: 200))
    }
    
    func testAnimateCellVertical() {
        let cell = MockAnimatableCell()
        cell.animate(.vertical, size: CGSize(width: 150, height: 250))
        
        XCTAssertTrue(cell.animateCalled)
        XCTAssertEqual(cell.animationStyle, .vertical)
        XCTAssertEqual(cell.animationSize, CGSize(width: 150, height: 250))
    }
    
    func testAnimateCellFade() {
        let cell = MockAnimatableCell()
        cell.animate(.fade, size: CGSize(width: 200, height: 300))
        
        XCTAssertTrue(cell.animateCalled)
        XCTAssertEqual(cell.animationStyle, .fade)
        XCTAssertEqual(cell.animationSize, CGSize(width: 200, height: 300))
    }
    
    func testReloadWithAnimation() {
        let tableView = MockTableView()
        tableView.reloadWithAnimation()
        
        XCTAssertTrue(tableView.reloadCalled)
    }
}
