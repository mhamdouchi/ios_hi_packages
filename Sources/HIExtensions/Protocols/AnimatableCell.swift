//
//  AnimatableCell.swift
//  DropRate
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import UIKit

public protocol AnimatableCell: UITableViewCell {
    func animate(_ orientation: UITableView.AnimationStyle, size: CGSize)
}

public extension AnimatableCell {
    func animate(_ style: UITableView.AnimationStyle, size: CGSize) {
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
