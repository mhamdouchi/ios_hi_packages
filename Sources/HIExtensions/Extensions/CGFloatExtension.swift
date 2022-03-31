//
//  CGFloatExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 3/30/22.
//

import UIKit

extension CGFloat {
    static var statusBarHeight: CGFloat {
        let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        let statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0

        return statusBarHeight
    }
}
