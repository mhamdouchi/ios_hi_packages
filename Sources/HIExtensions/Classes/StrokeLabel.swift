//
//  StrokeLabel.swift
//
//
//  Created by Mohamed Hamdouchi on 5/8/22.
//

import UIKit

public class StrokeLabel: UILabel {
    var strokeSize: CGFloat = 0
    var strokeColor: UIColor = .clear

    override public func drawText(in rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let textColor = textColor

        context?.setLineWidth(strokeSize)
        context?.setLineJoin(CGLineJoin.round)
        context?.setTextDrawingMode(CGTextDrawingMode.stroke)
        self.textColor = strokeColor
        super.drawText(in: rect)
        context?.setTextDrawingMode(.fill)
        self.textColor = textColor
        super.drawText(in: rect)
    }
}
