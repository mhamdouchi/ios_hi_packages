//
//  PaddingButton.swift
//
//
//  Created by Mohamed Hamdouchi on 5/6/22.
//

import UIKit

public class PaddingButton: UIButton {
    private let widthOffset: CGFloat
    private let heightOffset: CGFloat

    init(frame: CGRect, widthOffset: CGFloat = 20, heightOffset: CGFloat = 10) {
        self.widthOffset = widthOffset
        self.heightOffset = heightOffset

        super.init(frame: frame)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public var intrinsicContentSize: CGSize {
        let baseSize = super.intrinsicContentSize
        return CGSize(width: baseSize.width + 20, height: baseSize.height)
    }
}
