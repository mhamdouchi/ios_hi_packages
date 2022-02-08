//
//  IntExtension.swift
//  
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import Foundation

public extension Int {
    func formatNumber() -> String {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: NSNumber(value: self))!
    }
}
