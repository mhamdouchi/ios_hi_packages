//
//  UIViewExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import UIKit

// MARK: - Frame
extension UIView {
    var globalRect: CGRect? {
        superview?.convert(frame, to: nil)
    }

    var x: CGFloat {
        get { frame.origin.x }
        set { frame = CGRect(x: newValue, y: frame.origin.y, width: frame.size.width, height: frame.size.height) }
    }

    var top: CGFloat {
        get { frame.origin.y }
        set { frame = CGRect(x: frame.origin.x, y: newValue, width: frame.size.width, height: frame.size.height) }
    }

    var width: CGFloat {
        get { frame.size.width }
        set { frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: newValue, height: frame.size.height) }
    }

    var height: CGFloat {
        get { frame.size.height }
        set { frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: newValue) }
    }

    var y: CGFloat {
        get { x + width }
        set { x = newValue - width }
    }

    var bottom: CGFloat {
        get { top + height }
        set { top = newValue - height }
    }

    var centerX: CGFloat {
        get { x + width * 0.5 }
        set { x = newValue - width * 0.5 }
    }

    var centerY: CGFloat {
        get { top + height * 0.5 }
        set { top = newValue - height * 0.5 }
    }

    var relativeCenter: CGPoint {
        CGPoint(x: bounds.width / 2.0, y: bounds.height / 2.0)
    }

    var size: CGSize {
        get { frame.size }
        set { frame.size = newValue }
    }
}
