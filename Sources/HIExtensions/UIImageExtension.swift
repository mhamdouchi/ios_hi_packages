//
//  File.swift
//  
//
//  Created by Mohamed Hamdouchi on 7/4/23.
//

import UIKit

public extension UIImage {
    enum PointSize: CGFloat {
        case xSmall = 12
        case small = 16
        case medium = 20
        case large = 24
        case xLarge = 28
    }
    
    func configurePointSize(_ pointSize: PointSize) -> UIImage? {
        withConfiguration(UIImage.SymbolConfiguration(pointSize: pointSize.rawValue))
    }
}
