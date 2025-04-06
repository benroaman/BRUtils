//
//  NSLayoutXAxisAnchor+utils.swift
//  BRUtils
//
//  Created by Ben Roaman on 4/5/25.
//

import UIKit

public extension NSLayoutXAxisAnchor {
    func constraint(equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: anchor)
        constraint.priority = priority
        return constraint
    }
    
    func constraint(equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant c: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: anchor, constant: c)
        constraint.priority = priority
        return constraint
    }
    
    func constraint(lessThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: anchor)
        constraint.priority = priority
        return constraint
    }
    
    func constraint(lessThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant c: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: anchor, constant: c)
        constraint.priority = priority
        return constraint
    }
    
    func constraint(greaterThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: anchor)
        constraint.priority = priority
        return constraint
    }
    
    func constraint(greaterThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant c: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: anchor, constant: c)
        constraint.priority = priority
        return constraint
    }
}
