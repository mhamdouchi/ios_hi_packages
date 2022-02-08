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
        addMotionEffect(group)
    }
    
    func bounce(withScale scale: CGFloat = 1.2, andDuration duration: Double = 0.25, andDelay delay: TimeInterval = .zero, andDamping damping: CGFloat = 0.1, andVelocity velocity: CGFloat = 10.0) {
        transform = CGAffineTransform(scaleX: scale, y: scale)
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: .allowUserInteraction, animations: {
            self.transform = CGAffineTransform.identity
        })
    }
    
    func addGradient(with colors: [UIColor]) {
        let gradient = CAGradientLayer()
        
        gradient.colors = colors.map { $0.cgColor }
        gradient.locations = [0.0, 1.0]
        gradient.frame = bounds
        layer.insertSublayer(gradient, at: 0)
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
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = style.radius
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
