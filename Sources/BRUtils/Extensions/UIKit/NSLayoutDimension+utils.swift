//
//  NSLayoutDimension+utils.swift
//  BRUtils
//
//  Created by Ben Roaman on 4/5/25.
//

import UIKit

public extension NSLayoutDimension {
    func constraint(equalTo dimension: NSLayoutDimension, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: dimension)
        constraint.priority = priority
        return constraint
    }
    
    func constraint(equalTo dimension: NSLayoutDimension, constant c: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: dimension, constant: c)
        constraint.priority = priority
        return constraint
    }
    
    func constraint(lessThanOrEqualTo dimension: NSLayoutDimension, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: dimension)
        constraint.priority = priority
        return constraint
    }
    
    func constraint(lessThanOrEqualTo dimension: NSLayoutDimension, constant c: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: dimension, constant: c)
        constraint.priority = priority
        return constraint
    }
    
    func constraint(greaterThanOrEqualTo dimension: NSLayoutDimension, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: dimension)
        constraint.priority = priority
        return constraint
    }
    
    func constraint(greaterThanOrEqualTo dimension: NSLayoutDimension, constant c: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: dimension, constant: c)
        constraint.priority = priority
        return constraint
    }
    
    func constraint(equalToConstant c: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalToConstant: c)
        constraint.priority = priority
        return constraint
    }
    
    func constraint(equalTo dimension: NSLayoutDimension, multiplier: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: dimension, multiplier: multiplier)
        constraint.priority = priority
        return constraint
    }
    
    func constraint(greaterThanOrEqualTo dimension: NSLayoutDimension, multiplier: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(greaterThanOrEqualTo: dimension, multiplier: multiplier)
        constraint.priority = priority
        return constraint
    }
    
    func constraint(lessThanOrEqualTo dimension: NSLayoutDimension, multiplier: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(lessThanOrEqualTo: dimension, multiplier: multiplier)
        constraint.priority = priority
        return constraint
    }
    
    func constraint(equalTo dimension: NSLayoutDimension, multiplier: CGFloat, constant c: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: dimension, multiplier: multiplier, constant: c)
        constraint.priority = priority
        return constraint
    }
    
    func constraint(greaterThanOrEqualTo dimension: NSLayoutDimension, multiplier: CGFloat, constant c: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(greaterThanOrEqualTo: dimension, multiplier: multiplier, constant: c)
        constraint.priority = priority
        return constraint
    }
    
    func constraint(lessThanOrEqualTo dimension: NSLayoutDimension, multiplier: CGFloat, constant c: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(lessThanOrEqualTo: dimension, multiplier: multiplier, constant: c)
        constraint.priority = priority
        return constraint
    }
}
