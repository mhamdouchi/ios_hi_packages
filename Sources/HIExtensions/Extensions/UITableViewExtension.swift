//
//  UITableViewExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 3/10/22.
//

import UIKit

public extension UITableView {
    enum AnimationStyle {
        case horizontal
        case vertical
        case fade

        var duration: TimeInterval {
            switch self {
                case .fade:
                    return 0.8

                default:
                    return 0.3
            }
        }

        var delay: TimeInterval { 0.1 }
    }

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
