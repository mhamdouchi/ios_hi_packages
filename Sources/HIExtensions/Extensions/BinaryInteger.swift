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
}
