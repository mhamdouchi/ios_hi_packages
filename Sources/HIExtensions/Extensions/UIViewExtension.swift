//
//  UIViewExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import UIKit

public extension UIView {
    var globalRect: CGRect? {
        superview?.convert(frame, to: nil)
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

    typealias EmptyCompletion = () -> Void

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

// MARK: - Frame
extension UIView {
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

// MARK: - Constraint
public extension UIView {
    @discardableResult
    func align(with view: UIView, constant: CGFloat = .zero) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            leftAnchor.constraint(equalTo: view.leftAnchor, constant: constant),
            rightAnchor.constraint(equalTo: view.rightAnchor, constant: -constant),
            topAnchor.constraint(equalTo: view.topAnchor, constant: constant),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constant),
        ]

        NSLayoutConstraint.activate(constraints)

        return constraints
    }

    @discardableResult
    func alignLeadingTrailing(with view: UIView, constant: CGFloat = .zero) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            leftAnchor.constraint(equalTo: view.leftAnchor, constant: constant),
            rightAnchor.constraint(equalTo: view.rightAnchor, constant: -constant),
        ]

        NSLayoutConstraint.activate(constraints)

        return constraints
    }

    @discardableResult
    func alignTopBottom(with view: UIView, constant: CGFloat = .zero) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            topAnchor.constraint(equalTo: view.topAnchor, constant: constant),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constant),
        ]

        NSLayoutConstraint.activate(constraints)

        return constraints
    }

    @discardableResult
    func alignTopBottom(with layoutGuide: UILayoutGuide, constant: CGFloat = .zero) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: constant),
            bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -constant),
        ]

        NSLayoutConstraint.activate(constraints)

        return constraints
    }

    @discardableResult
    func alignTop(to anchor: NSLayoutYAxisAnchor, constant: CGFloat = .zero,
                  priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint
    {
        translatesAutoresizingMaskIntoConstraints = false

        let constraint = topAnchor.constraint(equalTo: anchor, constant: constant)

        constraint.priority = priority
        constraint.isActive = isActive

        return constraint
    }

    @discardableResult
    func alignTop(with guide: UILayoutGuide, constant: CGFloat = .zero, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        alignTop(to: guide.topAnchor, constant: constant, priority: priority, isActive: isActive)
    }

    @discardableResult
    func alignTop(with view: UIView, constant: CGFloat = .zero, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        alignTop(to: view.topAnchor, constant: constant, priority: priority, isActive: isActive)
    }

    @discardableResult
    func alignBottom(to anchor: NSLayoutYAxisAnchor, constant: CGFloat = .zero, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraint = bottomAnchor.constraint(equalTo: anchor, constant: constant)

        constraint.priority = priority
        constraint.isActive = isActive

        return constraint
    }

    @discardableResult
    func alignBottom(with guide: UILayoutGuide, constant: CGFloat = .zero, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        alignBottom(to: guide.bottomAnchor, constant: constant, priority: priority, isActive: isActive)
    }

    @discardableResult
    func alignBottom(with view: UIView, constant: CGFloat = .zero, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        alignBottom(to: view.bottomAnchor, constant: constant, priority: priority, isActive: isActive)
    }

    @discardableResult
    func alignLeading(to anchor: NSLayoutXAxisAnchor, constant: CGFloat = .zero, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraint = leadingAnchor.constraint(equalTo: anchor, constant: constant)

        constraint.isActive = isActive
        constraint.priority = priority

        return constraint
    }

    @discardableResult
    func alignLeading(with view: UIView, constant: CGFloat = .zero, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        alignLeading(to: view.leadingAnchor, constant: constant, priority: priority, isActive: isActive)
    }

    @discardableResult
    func alignTrailing(to anchor: NSLayoutXAxisAnchor, constant: CGFloat = .zero, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraint = trailingAnchor.constraint(equalTo: anchor, constant: constant)

        constraint.isActive = isActive
        constraint.priority = priority

        return constraint
    }

    @discardableResult
    func alignTrailing(with view: UIView, constant: CGFloat = .zero, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        alignTrailing(to: view.trailingAnchor, constant: constant, priority: priority, isActive: isActive)
    }

    @discardableResult
    func alignBottom(toTopOf view: UIView, constant: CGFloat = .zero, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        alignBottom(to: view.topAnchor, constant: constant, priority: priority, isActive: isActive)
    }

    @discardableResult
    func alignTrailing(toLeadingOf view: UIView, constant: CGFloat = .zero, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        alignTrailing(to: view.leadingAnchor, constant: constant, priority: priority, isActive: isActive)
    }

    @discardableResult
    func centerVertical(with view: UIView, constant: CGFloat = .zero, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraint = centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant)

        constraint.isActive = isActive
        constraint.priority = priority

        return constraint
    }

    @discardableResult
    func centerHorizontal(with view: UIView, constant: CGFloat = .zero, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraint = centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant)

        constraint.isActive = isActive
        constraint.priority = priority

        return constraint
    }

    @discardableResult
    func constrainHeight(_ value: CGFloat, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(equalToConstant: value)

        constraint.isActive = isActive
        constraint.priority = priority

        return constraint
    }

    @discardableResult
    func constrainWidth(_ value: CGFloat, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(equalToConstant: value)

        constraint.isActive = isActive
        constraint.priority = priority

        return constraint
    }

    @discardableResult
    func constrainWidth(to view: UIView, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(equalTo: view.widthAnchor)

        constraint.isActive = isActive
        constraint.priority = priority

        return constraint
    }

    @discardableResult
    func constrainHeight(to view: UIView, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(equalTo: view.heightAnchor)

        constraint.isActive = isActive
        constraint.priority = priority

        return constraint
    }

    func constraintSize(width: CGFloat, height: CGFloat, priority: UILayoutPriority = .required, isActive: Bool = true) {
        constrainWidth(width, priority: priority, isActive: isActive)
        constrainHeight(height, priority: priority, isActive: isActive)
    }

    @discardableResult
    func constrainHeightToWidth(ratio: CGFloat = 1, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(equalTo: widthAnchor, multiplier: ratio)

        constraint.isActive = isActive
        constraint.priority = priority

        return constraint
    }

    @discardableResult
    func constrainWidthToHeight(ratio: CGFloat = 1, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(equalTo: heightAnchor, multiplier: ratio)

        constraint.isActive = isActive
        constraint.priority = priority

        return constraint
    }
}

// MARK: - Nib
public extension UIView {
    @discardableResult
    func fromNib<T: UIView>() -> T? {
        guard let contentView = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? T else {
            return nil
        }

        return contentView
    }
}
