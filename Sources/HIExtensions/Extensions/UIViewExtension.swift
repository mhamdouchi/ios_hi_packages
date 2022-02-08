//
//  UIViewExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import UIKit

public extension UIView {
    typealias EmptyCompletion = () -> Void

    var globalRect: CGRect? {
        return superview?.convert(frame, to: nil)
    }

    func addParallaxEffect() {
        let amount = 40.0
        let horizontal = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        horizontal.minimumRelativeValue = -amount
        horizontal.maximumRelativeValue = amount

        let vertical = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        vertical.minimumRelativeValue = -amount
        vertical.maximumRelativeValue = amount

        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontal, vertical]
        addMotionEffect(group)
    }
}

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

// MARK: - Movement
public extension UIView {
    func startJiggling() {
        let positionAnimation = CABasicAnimation(keyPath: "position")
        positionAnimation.fromValue = NSValue(cgPoint: CGPoint(x: center.x - 2, y: center.y))
        positionAnimation.toValue = NSValue(cgPoint: CGPoint(x: center.x + 2, y: center.y))
        positionAnimation.duration = 0.05
        positionAnimation.repeatCount = 25
        positionAnimation.autoreverses = true

        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = CGFloat(Double.pi * -0.1)
        rotateAnimation.toValue = CGFloat(Double.pi * 0.1)
        rotateAnimation.duration = 0.05
        rotateAnimation.repeatCount = 25
        rotateAnimation.autoreverses = true

        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block: { _ in
            self.layer.add(positionAnimation, forKey: nil)
            self.layer.add(rotateAnimation, forKey: nil)
        })
    }

    func bounce(withScale scale: CGFloat = 1.2, andDuration duration: Double = 0.25, andDelay delay: TimeInterval = .zero, andDamping damping: CGFloat = 0.1, andVelocity velocity: CGFloat = 10.0, _ completion: EmptyCompletion? = nil) {
        transform = CGAffineTransform(scaleX: scale, y: scale)
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: .allowUserInteraction) {
            self.transform = CGAffineTransform.identity
        } completion: { _ in
            completion?()
        }
    }
}

// MARK: - Shadow
public extension UIView {
    enum ShadowStyle {
        case light
        case medium
        case heavy

        var radius: CGFloat {
            switch self {
                case .light:
                    return 2.0
                case .medium:
                    return 5.0
                case .heavy:
                    return 8.0
            }
        }
    }

    func dropShadow(_ style: ShadowStyle = .medium) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = style.radius
    }
}

// MARK: - Shape
public extension UIView {
    enum Shape {
        case circle
        case rounded(_ cornerRadius: CGFloat)
    }

    func toShape(_ shape: Shape, backgroundColor: UIColor? = nil, borderWidth: CGFloat = .zero, borderColor: UIColor? = nil) {
        clipsToBounds = true

        switch shape {
            case .circle:
                layer.cornerRadius = frame.height / 2.0

            case let .rounded(cornerRadius):
                layer.cornerRadius = cornerRadius
        }

        if let backgroundColor = backgroundColor {
            self.backgroundColor = backgroundColor
        }

        layer.borderWidth = borderWidth

        if let borderColor = borderColor {
            layer.borderColor = borderColor.cgColor
        }
    }
}
