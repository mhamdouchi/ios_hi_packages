//
//  UIViewExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import UIKit

// MARK: - Shadow
public extension UIView {
    enum ShadowStyle {
        case subtle
        case light
        case medium
        case heavy

        var radius: CGFloat {
            switch self {
                case .subtle:
                    return 1.0
                case .light:
                    return 2.0
                case .medium:
                    return 5.0
                case .heavy:
                    return 8.0
            }
        }
    }

    func dropShadow(_ style: ShadowStyle = .medium, color: UIColor = .black) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = style.radius
    }
}
