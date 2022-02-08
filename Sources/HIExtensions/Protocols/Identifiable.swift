//
//  Identifiable.swift
//
//
//  Created by Yasseen Hamdouchi on 3/4/21.
//

import UIKit

public protocol Identifiable: UIViewController {
    static var storyboardName: String { get }
    static var controllerName: String { get }
}
