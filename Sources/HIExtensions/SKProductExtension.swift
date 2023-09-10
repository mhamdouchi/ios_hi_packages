//
//  SKProductExtension.swift
//  
//
//  Created by Mohamed Hamdouchi on 9/10/23.
//

import Foundation
import StoreKit

public extension SKProduct {
    var localizedPrice: String? {
        let formatter = NumberFormatter()

        formatter.formatterBehavior = .behavior10_4
        formatter.numberStyle = .currency
        formatter.locale = priceLocale

        guard let priceLocale = formatter.string(from: price)
        else { return nil }
        
        return priceLocale
    }
}
