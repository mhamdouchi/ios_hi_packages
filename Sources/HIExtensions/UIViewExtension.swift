//
//  UIViewExtension.swift
//  
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import UIKit

public extension UIView {
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
        self.addMotionEffect(group)
    }
}

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
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = style.radius
    }
}

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
                
            case .rounded(let cornerRadius):
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
