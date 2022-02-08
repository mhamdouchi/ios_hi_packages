//
//  UINavigationControllerExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 2/12/22.
//

import UIKit

extension UINavigationController {
    static let defaultFont = UIFont(name: "HelveticaNeue-CondensedBold", size: 18.0)!

    func stylizePromptBar(_ font: UIFont = UINavigationController.defaultFont, textColor: UIColor = .systemBlue) {
        for view in navigationBar.subviews {
            let subviews = view.subviews

            if subviews.count > 0, let label = subviews[0] as? UILabel {
                label.font = font
                label.textColor = textColor
                label.sizeToFit()
            }
        }
    }
}
