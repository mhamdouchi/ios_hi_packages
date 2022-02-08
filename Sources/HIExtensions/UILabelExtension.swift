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
    
    func setHighlighted(_ text: String, with search: String, lightColor: UIColor = .systemYellow, darkColor: UIColor = .systemOrange) {
        let attributedText = NSMutableAttributedString(string: text)
        let range = NSString(string: text).range(of: search, options: .caseInsensitive)
        let highlightColor = traitCollection.userInterfaceStyle == .light ? lightColor : darkColor
        let highlightedAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.backgroundColor: highlightColor]
        
        attributedText.addAttributes(highlightedAttributes, range: range)
        self.attributedText = attributedText
    }
}
