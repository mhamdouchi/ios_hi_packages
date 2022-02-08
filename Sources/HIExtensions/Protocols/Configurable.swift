//
//  Configurable.swift
//
//
//  Created by Mohamed Hamdouchi on 3/4/21.
//

import Foundation

public protocol Configurable {
    associatedtype Model

    func configureCoordinator(_ coordinator: Model)
}
