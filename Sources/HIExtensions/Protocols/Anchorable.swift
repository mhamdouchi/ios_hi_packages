//
//  Anchorable.swift
//
//
//  Created by Mohamed Hamdouchi on 3/11/22.
//

import UIKit

public protocol Anchorable {
    var topAnchor: NSLayoutYAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var leadingAnchor: NSLayoutXAxisAnchor { get }

    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }

    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
}

extension UIView: Anchorable {}
