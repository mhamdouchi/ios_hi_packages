//
//  File.swift
//  
//
//  Created by Mohamed Hamdouchi on 7/4/23.
//

import UIKit

public extension UIImage {
    enum PointSize: CGFloat {
        case xSmall = 14
        case small = 16
        case medium = 18
        case large = 20
        case xLarge = 22
    }
    
    func configurePointSize(_ pointSize: PointSize) {
        self.withConfiguration(UIImage.SymbolConfiguration(pointSize: pointSize.rawValue))
    }
}
