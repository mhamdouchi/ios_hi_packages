//
//  UIColorExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 3/16/22.
//

import UIKit

public extension UIColor {
    static func colorWithHex(hexValue: UInt64, alphaValue: CGFloat = 1.0) -> UIColor {
        UIColor(
            red: CGFloat((hexValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hexValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hexValue & 0x0000FF) / 255.0,
            alpha: alphaValue
        )
    }
}
