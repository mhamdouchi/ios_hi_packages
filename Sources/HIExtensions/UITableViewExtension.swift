//
//  UITableViewExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 3/10/22.
//

import HIProtocols
import UIKit

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
