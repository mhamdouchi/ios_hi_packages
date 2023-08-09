//
//  BinaryInteger.swift
//
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import Foundation

public extension BinaryInteger {
    var isEven: Bool { self % 2 == 0 }

    var isOdd: Bool { self % 2 != 0 }
        
    func toOrdinal() -> String {
        let numberAsString = String(self)
        
        if numberAsString.hasSuffix("11") || numberAsString.hasSuffix("12") || numberAsString.hasSuffix("13") {
            return "\(self)th"
        }
        
        switch self % 10 {
            case 1:
                return "\(self)st"
                
            case 2:
                return "\(self)nd"
                
            case 3:
                return "\(self)rd"
                
            default:
                return "\(self)th"
        }
    }
}
