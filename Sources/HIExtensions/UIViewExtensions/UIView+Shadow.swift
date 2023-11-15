//
//  UIViewExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import SwiftUI
import UIKit

// MARK: - Shadow
public enum ShadowStyle {
    case none
    case subtle
    case light
    case medium
    case heavy

    var radius: CGFloat {
        switch self {
            case .none:
                return .zero
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

public extension UIView {
    func dropShadow(_ style: ShadowStyle = .medium, color: UIColor = .black) {
        switch style {
            case .none:
                break

            default:
                layer.masksToBounds = false
                layer.shadowColor = color.cgColor
                layer.shadowOpacity = 0.2
                layer.shadowOffset = CGSize.zero
                layer.shadowRadius = style.radius
        }
    }
}

public extension View {
    func dropShadow(_ style: ShadowStyle = .medium, color: Color = .black) -> some View {
        shadow(
            color: color.opacity(0.2),
            radius: style.radius,
            x: 0,
            y: 0
        )
    }
}
