//
//  PaddingLabel.swift
//
//
//  Created by Mohamed Hamdouchi on 3/6/22.
//

import UIKit

public class PaddingLabel: UILabel {
    @IBInspectable public var topInset: CGFloat = 0
    @IBInspectable public var leftInset: CGFloat = 8
    @IBInspectable public var bottomInset: CGFloat = 0
    @IBInspectable public var rightInset: CGFloat = 8

    override public func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }

    override public var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize

        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }

    override public var bounds: CGRect {
        didSet {
            preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
        }
    }
}
