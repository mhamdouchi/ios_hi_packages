//
//  UIAlertControllerExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import UIKit

public extension UIAlertController {
    func addActions(_ actions: [UIAlertAction?]) {
        actions.compactMap { $0 }.forEach { addAction($0) }
    }
}
