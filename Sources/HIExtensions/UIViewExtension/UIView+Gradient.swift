//
//  UIViewExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import UIKit

// MARK: - Gradient
public extension UIView {
    func addGradient(with colors: [UIColor]) {
        if let firstLayer = layer.sublayers?.first as? CAGradientLayer {
            firstLayer.removeFromSuperlayer()
        }

        let gradient = CAGradientLayer()

        gradient.colors = colors.map { $0.cgColor }
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.frame = bounds

        layer.insertSublayer(gradient, at: 0)
    }
}
