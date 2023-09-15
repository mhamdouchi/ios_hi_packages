//
//  PaddingButton.swift
//
//
//  Created by Mohamed Hamdouchi on 5/6/22.
//

import UIKit

open class PaddingButton: UIButton {
    private let widthOffset: CGFloat
    private let heightOffset: CGFloat

    public init(frame: CGRect, widthOffset: CGFloat = 20, heightOffset: CGFloat = 10) {
        self.widthOffset = widthOffset
        self.heightOffset = heightOffset

        super.init(frame: frame)
    }

    public required init?(coder aDecoder: NSCoder) {
        widthOffset = 20
        heightOffset = 10

        super.init(coder: aDecoder)
    }

    override public var intrinsicContentSize: CGSize {
        let baseSize = super.intrinsicContentSize
        return CGSize(width: baseSize.width + widthOffset, height: baseSize.height + heightOffset)
    }
}
