//
//  UIButtonExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 8/31/23.
//

import UIKit

public extension UIButton {
    func bringTitleAndImageToFront() {
        if let titleLabel = titleLabel, let imageView = imageView {
            bringSubviewToFront(titleLabel)
            bringSubviewToFront(imageView)
        }
    }
}
