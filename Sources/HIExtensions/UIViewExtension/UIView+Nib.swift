//
//  UIViewExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import UIKit

// MARK: - Nib
public extension UIView {
    @discardableResult
    func fromNib<T: UIView>() -> T? {
        guard let contentView = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? T else {
            return nil
        }

        return contentView
    }
}
