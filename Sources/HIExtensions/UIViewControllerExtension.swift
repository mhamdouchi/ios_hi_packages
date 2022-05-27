//
//  UIViewControllerExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import UIKit

public extension UIViewController {
    func presentAlert(title: String? = nil, message: String? = nil, actions: [UIAlertAction]? = nil) {
        if title == nil, message == nil { return }

        let alertActions = actions ?? [UIAlertAction(title: "Close", style: .default, handler: nil)]
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alertActions.forEach { alert.addAction($0) }

        present(alert, animated: true)
    }
}

// Static Methods
public extension UIViewController {
    static func getTopViewController() -> UIViewController? {
        guard let rootViewController = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first?.rootViewController,
              var topController = rootViewController.presentedViewController
        else { return nil }

        while let presentedViewController = topController.presentedViewController {
            topController = presentedViewController
        }

        return topController
    }
}
