//
//  UITableViewExtension.swift
//  
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import UIKit

protocol AnimatableCell: UITableViewCell {
    func animate(_ orientation: UITableView.AnimationStyle, size: CGSize)
}

extension AnimatableCell {
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
