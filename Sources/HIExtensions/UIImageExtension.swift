//
//  File.swift
//  
//
//  Created by Mohamed Hamdouchi on 7/4/23.
//

import UIKit

public extension UIImage {
    enum PointSize: CGFloat {
        case xxSmall = 12
        case xSmall = 14
        case small = 16
        case medium = 18
        case large = 20
        case xLarge = 22
        case xxLarge = 24
    }
    
    func configurePointSize(_ pointSize: PointSize) -> UIImage? {
        withConfiguration(UIImage.SymbolConfiguration(pointSize: pointSize.rawValue))
    }
}
