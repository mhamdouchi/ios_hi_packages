//
//  UIViewExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import UIKit

// MARK: - Jiggle
public extension UIView {
    enum JigglingLength: Float {
        case short = 6
        case medium = 12
        case long = 24
    }

    func startJiggling(_ length: JigglingLength = .long) {
        let positionAnimation = CABasicAnimation(keyPath: "position")
        positionAnimation.fromValue = NSValue(cgPoint: CGPoint(x: center.x - 2, y: center.y))
        positionAnimation.toValue = NSValue(cgPoint: CGPoint(x: center.x + 2, y: center.y))
        positionAnimation.duration = 0.05
        positionAnimation.repeatCount = length.rawValue
        positionAnimation.autoreverses = true

        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = CGFloat(Double.pi * -0.1)
        rotateAnimation.toValue = CGFloat(Double.pi * 0.1)
        rotateAnimation.duration = 0.05
        rotateAnimation.repeatCount = length.rawValue
        rotateAnimation.autoreverses = true

        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block: { _ in
            self.layer.add(positionAnimation, forKey: nil)
            self.layer.add(rotateAnimation, forKey: nil)
        })
    }
}
