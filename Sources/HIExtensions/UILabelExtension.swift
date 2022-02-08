//
//  UILabelExtension.swift
//  
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import UIKit

public extension UILabel {
    enum Style {
        case light(_ size: CGFloat = 16.0)
        case normal(_ size: CGFloat = 16.0)
        case bold(_ size: CGFloat = 16.0)
        
        var font: UIFont {
            switch self {
                case .light(let size):
                    return UIFont.systemFont(ofSize: size, weight: .light)
                    
                case .normal(let size):
                    return UIFont.systemFont(ofSize: size)
                    
                case .bold(let size):
                    return UIFont(name: "HelveticaNeue-CondensedBold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
            }
        }
    }
    
    func setCustomText(_ message: [(String, Style)]) {
        let combination = NSMutableAttributedString()
        
        message.forEach { textValue, style in
            let attributedText = NSAttributedString(string: textValue, attributes: [NSAttributedString.Key.font: style.font])
            combination.append(attributedText)
        }
        
        attributedText = combination
    }
}
