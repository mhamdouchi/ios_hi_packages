//
//  UITextFieldExtension.swift
//  
//
//  Created by Mohamed Hamdouchi on 2/8/22.
//

import UIKit

public extension UITextField {
    func addInputAccessoryButton(title: String, target: Any, selector: Selector) {
        let toolBar = UIToolbar(frame: CGRect(x: .zero, y: .zero, width: UIScreen.main.bounds.size.width, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let barButton = UIBarButtonItem(title: title, style: .plain, target: target, action: selector)
        
        toolBar.setItems([flexible, barButton], animated: false)
        toolBar.backgroundColor = UIColor.secondarySystemBackground
        inputAccessoryView = toolBar
    }
}
