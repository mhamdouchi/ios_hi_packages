//
//  CustomPrint.swift
//
//
//  Created by Mohamed Hamdouchi on 11/15/22.
//

import Foundation

public func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    #if DEBUG
        let output = items.map { "\($0)" }.joined(separator: separator)
        Swift.print(output, terminator: terminator)
    #endif
}
