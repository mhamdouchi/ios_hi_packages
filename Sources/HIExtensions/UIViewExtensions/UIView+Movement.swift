//
//  UIViewExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import UIKit

// MARK: - Movement
public extension UIView {
    func bounce(withScale scale: CGFloat = 1.2, andDuration duration: Double = 0.25, andDelay delay: TimeInterval = .zero, andDamping damping: CGFloat = 0.1, andVelocity velocity: CGFloat = 10.0, _ completion: (() -> Void)? = nil) {
        transform = CGAffineTransform(scaleX: scale, y: scale)
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: .allowUserInteraction) {
            self.transform = CGAffineTransform.identity
        } completion: { _ in
            completion?()
        }
    }

    func shake(withDuration duration: TimeInterval = 0.4, withAmplitude amplitude: CGFloat = 6) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = duration
        var values: [CGFloat] = []

        let numberOfFrames = Int(duration / 0.1)

        for _ in 0 ..< numberOfFrames {
            values.append(-amplitude)
            values.append(amplitude)
        }

        animation.values = values
        layer.add(animation, forKey: "shake")

        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.layer.removeAnimation(forKey: "shake")
        }
    }
}
