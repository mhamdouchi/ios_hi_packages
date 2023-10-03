//
//  UIViewExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import UIKit

// MARK: - Blur
public extension UIView {
    fileprivate enum AssociatedKeys {
        static var blurView = UnsafeRawPointer(bitPattern: "blurView".hashValue)!
    }

    private var blurView: UIVisualEffectView? {
        get {
            return objc_getAssociatedObject(self, AssociatedKeys.blurView) as? UIVisualEffectView
        }

        set {
            objc_setAssociatedObject(self, AssociatedKeys.blurView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    func addBlurEffect(style: UIBlurEffect.Style = .light, alpha: CGFloat = 0.5) {
        if blurView == nil {
            let blurEffect = UIBlurEffect(style: style)
            let blurView = UIVisualEffectView(effect: blurEffect)

            blurView.alpha = alpha
            addSubview(blurView)
            blurView.align(with: self, inset: -10)
            self.blurView = blurView

            blurView.isUserInteractionEnabled = false
        }
    }

    func removeVibrantBlurEffect() {
        blurView?.removeFromSuperview()
        blurView = nil
    }
}
