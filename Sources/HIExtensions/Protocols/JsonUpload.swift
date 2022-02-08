//
//  JsonUpload.swift
//  DropRate
//
//  Created by Mohamed Hamdouchi on 10/2/21.
//

import Foundation

public protocol JsonUpload {
    func toJson() -> [String: Any]
}
