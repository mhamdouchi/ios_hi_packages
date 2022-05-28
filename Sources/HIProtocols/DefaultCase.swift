//
//  DefaultCase.swift
//
//
//  Created by Mohamed Hamdouchi on 3/3/21.
//

import Foundation

public protocol DefaultCase: RawRepresentable {
    static var defaultCase: Self { get }
}

public extension DefaultCase {
    static func create(with value: RawValue?) -> Self {
        guard let rawValue = value,
              let value = Self(rawValue: rawValue)
        else { return .defaultCase }

        return value
    }
}
