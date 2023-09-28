//
//  UIViewExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import UIKit

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
