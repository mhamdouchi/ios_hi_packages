//
//  UIColorExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 3/16/22.
//

import UIKit

public extension UIColor {
    static func colorWithHexString(hexString: String, alphaValue: CGFloat = 1) -> UIColor {
        var cString: String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }

        if (cString.count) != 6 {
            return UIColor.darkGray
        }

        var hexValue: UInt64 = 0

        Scanner(string: cString).scanHexInt64(&hexValue)

        return UIColor.colorWithHex(hexValue: hexValue, alphaValue: alphaValue)
    }

    static func colorWithHex(hexValue: UInt64, alphaValue: CGFloat = 1) -> UIColor {
        UIColor(
            red: CGFloat((hexValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hexValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hexValue & 0x0000FF) / 255.0,
            alpha: alphaValue
        )
    }
}
