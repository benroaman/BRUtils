//
//  NSLayoutYAxisAnchor+utils.swift
//  BRUtils
//
//  Created by Ben Roaman on 4/5/25.
//

import UIKit

public extension NSLayoutYAxisAnchor {
    func constraint(equalTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: anchor)
        constraint.priority = priority
        return constraint
    }
    
    func constraint(equalTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant c: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: anchor, constant: c)
        constraint.priority = priority
        return constraint
    }
    
    func constraint(lessThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: anchor)
        constraint.priority = priority
        return constraint
    }
    
    func constraint(lessThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant c: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: anchor, constant: c)
        constraint.priority = priority
        return constraint
    }
    
    func constraint(greaterThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: anchor)
        constraint.priority = priority
        return constraint
    }
    
    func constraint(greaterThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant c: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: anchor, constant: c)
        constraint.priority = priority
        return constraint
    }
}
