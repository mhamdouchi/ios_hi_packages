//
//  PaddingButton.swift
//
//
//  Created by Mohamed Hamdouchi on 5/6/22.
//

import UIKit

@IBDesignable
open class PaddingButton: UIButton {
    @IBInspectable var widthOffset: CGFloat = 20
    @IBInspectable var heightOffset: CGFloat = 10
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override public var intrinsicContentSize: CGSize {
        let baseSize = super.intrinsicContentSize
        return CGSize(width: baseSize.width + widthOffset, height: baseSize.height + heightOffset)
    }
}
