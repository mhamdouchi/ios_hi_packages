//
//  IntExtension.swift
//  
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import Foundation

public extension Int {
    func formatNumber(_ separator: String = ",") -> String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = separator
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self))!
    }
}
