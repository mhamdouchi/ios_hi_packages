//
//  UIViewControllerExtension.swift
//  
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import UIKit

public extension UIViewController {
    func presentAlert(title: String? = nil, message: String? = nil, actions: Array<UIAlertAction>? = nil) {
        if title == nil && message == nil { return }
        
        let alertActions = actions ?? [UIAlertAction(title: "Close", style: .default, handler: nil)]
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertActions.forEach { alert.addAction($0) }
        
        self.present(alert, animated: true)
    }
}
