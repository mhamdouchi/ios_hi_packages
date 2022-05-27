//
//  AnimatableCell.swift
//  DropRate
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

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
    func animate(_ orientation: AnimationStyle, size: CGSize)
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
