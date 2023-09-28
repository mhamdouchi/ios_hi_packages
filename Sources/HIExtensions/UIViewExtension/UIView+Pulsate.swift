//
//  UIViewExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import UIKit

// MARK: - Pulsate
public extension UIView {
    enum PulsateSize: Float {
        case small = 1.05
        case medium = 1.1
        case large = 1.15
        case huge = 1.2
    }

    func startPulsating(_ size: PulsateSize = .small) {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.duration = 0.25
        animation.repeatCount = .infinity
        animation.autoreverses = true
        animation.toValue = size.rawValue
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)

        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block: { _ in
            self.layer.add(animation, forKey: "Pulsating")
        })
    }

    func stopPulsating() {
        layer.removeAnimation(forKey: "Pulsating")
    }
}
