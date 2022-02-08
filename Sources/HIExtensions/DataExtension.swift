//
//  DataExtension.swift
//  
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import Foundation

public extension Data {
    var hexString: String { map { String(format: "%02.2hhx", $0) }.joined() }
}
