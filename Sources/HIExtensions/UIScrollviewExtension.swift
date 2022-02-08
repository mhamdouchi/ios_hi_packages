//
//  UIScrollviewExtension.swift
//  
//
//  Created by Mohamed Hamdouchi on 2/12/22.
//

import UIKit

extension UIScrollView {
    func scrollToRight(animated: Bool) {
        guard contentSize.width > bounds.size.width
        else { return }
        
        let rightOffset = CGPoint(x: contentSize.width - bounds.size.width, y: 0)
        setContentOffset(rightOffset, animated: animated)
    }

	func scrollToTop() {
		let topOffset = CGPoint.zero
		setContentOffset(topOffset, animated: true)
	}

	func scrollToBottom() {
		let topOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height)
		setContentOffset(topOffset, animated: true)
	}
}
