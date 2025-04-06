//
//  UIUserInterfaceStyle+utils.swift
//  BRUtils
//
//  Created by Ben Roaman on 4/5/25.
//

import UIKit

public extension UIUserInterfaceStyle {
    static var current: UIUserInterfaceStyle { UIScreen.main.traitCollection.userInterfaceStyle }
    var opposite: UIUserInterfaceStyle {
        switch self {
        case .dark: return .light
        case .light: return .dark
        case .unspecified: return .unspecified
        @unknown default: return .unspecified
        }
    }
}

