//
//  UITableViewExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 3/10/22.
//

import SwiftUI
import UIKit

public enum AnimationStyle {
    case horizontal
    case vertical
    case fade

    public var duration: TimeInterval {
        switch self {
            case .fade:
                return 0.8

            default:
                return 0.3
        }
    }

    public var delay: TimeInterval { 0.1 }
}

public protocol AnimatableCell: UITableViewCell {
    func animate(_ style: AnimationStyle, size: CGSize)
}

public extension AnimatableCell {
    func animate(_ style: AnimationStyle, size: CGSize) {
        switch style {
            case .horizontal:
                transform = CGAffineTransform(translationX: size.width, y: .zero)

            case .vertical:
                transform = CGAffineTransform(translationX: .zero, y: size.height)

            case .fade:
                alpha = .zero
        }
    }
}

public extension UITableView {
    func reloadWithAnimation(_ style: AnimationStyle = .fade) {
        reloadData()
        UIDevice.playHapticImpact(with: .light)

        var delayCounter = 0
        let tableViewSize = bounds.size
        let cells = visibleCells

        for cell in cells {
            if let animatableCell = cell as? AnimatableCell {
                animatableCell.animate(style, size: tableViewSize)

                UIView.animate(withDuration: style.duration, delay: style.delay * Double(delayCounter), usingSpringWithDamping: 0.7, initialSpringVelocity: .zero, options: .curveEaseIn, animations: {
                    cell.transform = CGAffineTransform.identity
                    cell.alpha = 1.0
                })

                delayCounter += 1
            }
        }
    }
}

public protocol AnimatableView: View {
    func animate(_ style: AnimationStyle, size: CGSize)
}

public extension AnimatableView {
    mutating func animate(_ style: AnimationStyle, size: CGSize) {
        withAnimation {
            switch style {
                case .horizontal:
                    self = self.offset(CGSize(width: size.width, height: 0)) as! Self

                case .vertical:
                    self = self.offset(CGSize(width: 0, height: size.height)) as! Self

                case .fade:
                    self = self.opacity(0.0) as! Self
            }
        }
    }
}
