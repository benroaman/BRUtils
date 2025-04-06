//
//  UIEdgeInsets+utils.swift
//  BRUtils
//
//  Created by Ben Roaman on 4/5/25.
//

import UIKit

extension UIEdgeInsets {
    static var buttonImage: UIEdgeInsets { UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0) }
    
    static func make(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) -> UIEdgeInsets {
        .init(top: top, left: left, bottom: bottom, right: right)
    }
    
    static func make(horizontal: CGFloat, top: CGFloat, bottom: CGFloat) -> UIEdgeInsets {
        .init(top: top, left: horizontal, bottom: bottom, right: horizontal)
    }
    
    static func make(vertical: CGFloat, left: CGFloat, right: CGFloat) -> UIEdgeInsets {
        .init(top: vertical, left: left, bottom: vertical, right: right)
    }
    
    static func make(horizontal: CGFloat = 0, vertical: CGFloat = 0) -> UIEdgeInsets {
        .init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
    
    static func make(_ dimension: CGFloat) -> UIEdgeInsets {
        .init(top: dimension, left: dimension, bottom: dimension, right: dimension)
    }
    
    static func make(_ base: UIEdgeInsets, top: CGFloat? = nil, left: CGFloat? = nil, bottom: CGFloat? = nil, right: CGFloat? = nil) -> UIEdgeInsets {
        .init(top: top ?? base.top, left: left ?? base.left, bottom: bottom ?? base.bottom, right: right ?? base.right)
    }
}
