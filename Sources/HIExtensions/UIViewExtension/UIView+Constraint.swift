//
//  UIViewExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import UIKit

// MARK: - Constraint
public extension UIView {
    @discardableResult
    func align(with view: UIView, inset: CGFloat = .zero) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset),
            topAnchor.constraint(equalTo: view.topAnchor, constant: inset),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -inset),
        ]

        NSLayoutConstraint.activate(constraints)

        return constraints
    }

    @discardableResult
    func alignLeadingTrailing(with view: UIView, inset: CGFloat = .zero) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset),
        ]

        NSLayoutConstraint.activate(constraints)

        return constraints
    }

    @discardableResult
    func alignTopBottom(with view: UIView, inset: CGFloat = .zero) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            topAnchor.constraint(equalTo: view.topAnchor, constant: inset),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -inset),
        ]

        NSLayoutConstraint.activate(constraints)

        return constraints
    }

    @discardableResult
    func alignTopBottom(with layoutGuide: UILayoutGuide, inset: CGFloat = .zero) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: inset),
            bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -inset),
        ]

        NSLayoutConstraint.activate(constraints)

        return constraints
    }

    @discardableResult
    func alignTop(to anchor: NSLayoutYAxisAnchor, inset: CGFloat = .zero,
                  priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint
    {
        translatesAutoresizingMaskIntoConstraints = false

        let constraint = topAnchor.constraint(equalTo: anchor, constant: inset)

        constraint.priority = priority
        constraint.isActive = isActive

        return constraint
    }

    @discardableResult
    func alignTop(with guide: UILayoutGuide, inset: CGFloat = .zero, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        alignTop(to: guide.topAnchor, inset: inset, priority: priority, isActive: isActive)
    }

    @discardableResult
    func alignTop(with view: UIView, inset: CGFloat = .zero, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        alignTop(to: view.topAnchor, inset: inset, priority: priority, isActive: isActive)
    }

    @discardableResult
    func alignBottom(to anchor: NSLayoutYAxisAnchor, inset: CGFloat = .zero, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraint = bottomAnchor.constraint(equalTo: anchor, constant: inset)

        constraint.priority = priority
        constraint.isActive = isActive

        return constraint
    }

    @discardableResult
    func alignBottom(with guide: UILayoutGuide, inset: CGFloat = .zero, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        alignBottom(to: guide.bottomAnchor, inset: inset, priority: priority, isActive: isActive)
    }

    @discardableResult
    func alignBottom(with view: UIView, inset: CGFloat = .zero, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        alignBottom(to: view.bottomAnchor, inset: inset, priority: priority, isActive: isActive)
    }

    @discardableResult
    func alignLeading(to anchor: NSLayoutXAxisAnchor, inset: CGFloat = .zero, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraint = leadingAnchor.constraint(equalTo: anchor, constant: inset)

        constraint.isActive = isActive
        constraint.priority = priority

        return constraint
    }

    @discardableResult
    func alignLeading(with view: UIView, inset: CGFloat = .zero, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        alignLeading(to: view.leadingAnchor, inset: inset, priority: priority, isActive: isActive)
    }

    @discardableResult
    func alignTrailing(to anchor: NSLayoutXAxisAnchor, inset: CGFloat = .zero, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraint = trailingAnchor.constraint(equalTo: anchor, constant: inset)

        constraint.isActive = isActive
        constraint.priority = priority

        return constraint
    }

    @discardableResult
    func alignTrailing(with view: UIView, inset: CGFloat = .zero, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        alignTrailing(to: view.trailingAnchor, inset: inset, priority: priority, isActive: isActive)
    }

    @discardableResult
    func alignBottom(toTopOf view: UIView, inset: CGFloat = .zero, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        alignBottom(to: view.topAnchor, inset: inset, priority: priority, isActive: isActive)
    }

    @discardableResult
    func alignTrailing(toLeadingOf view: UIView, inset: CGFloat = .zero, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        alignTrailing(to: view.leadingAnchor, inset: inset, priority: priority, isActive: isActive)
    }

    @discardableResult
    func centerVertical(with view: UIView, inset: CGFloat = .zero, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraint = centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: inset)

        constraint.isActive = isActive
        constraint.priority = priority

        return constraint
    }

    @discardableResult
    func centerHorizontal(with view: UIView, inset: CGFloat = .zero, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraint = centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: inset)

        constraint.isActive = isActive
        constraint.priority = priority

        return constraint
    }

    @discardableResult
    func constrainHeight(_ value: CGFloat, priority: UILayoutPriority = .required, isActive: Bool = true, relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        let constraint: NSLayoutConstraint

        switch relation {
            case .greaterThanOrEqual:
                constraint = heightAnchor.constraint(greaterThanOrEqualToConstant: value)

            case .lessThanOrEqual:
                constraint = heightAnchor.constraint(lessThanOrEqualToConstant: value)

            default:
                constraint = heightAnchor.constraint(equalToConstant: value)
        }

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

    @discardableResult
    func constrainAspectRatio(ratio: CGFloat = 1, priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: self, attribute: .height, multiplier: ratio, constant: .zero)

        constraint.isActive = isActive
        constraint.priority = priority

        return constraint
    }
}
