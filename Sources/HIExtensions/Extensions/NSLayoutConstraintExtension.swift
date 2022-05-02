//
//  NSLayoutConstraintExtension.swift
//
//
//  Created by Mohamed Hamdouchi on 5/2/22.
//

import UIKit

extension NSLayoutConstraint {
    func setMultiplier(multiplier: CGFloat) -> NSLayoutConstraint {
        guard let firstItem = firstItem else {
            return self
        }

        NSLayoutConstraint.deactivate([self])

        let newConstraint = NSLayoutConstraint(item: firstItem, attribute: firstAttribute, relatedBy: relation, toItem: secondItem, attribute: secondAttribute, multiplier: multiplier, constant: constant)

        newConstraint.priority = priority
        newConstraint.shouldBeArchived = shouldBeArchived
        newConstraint.identifier = identifier
        NSLayoutConstraint.activate([newConstraint])

        return newConstraint
    }
}
