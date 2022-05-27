//
//  SKStoreReviewControllerExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 5/6/22.
//

import StoreKit

public extension SKStoreReviewController {
    static func requestReviewInCurrentScene() {
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            requestReview(in: scene)
        }
    }
}
