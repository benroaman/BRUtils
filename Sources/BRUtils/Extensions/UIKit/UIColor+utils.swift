//
//  UIColor+utils.swift
//  BRUtils
//
//  Created by Ben Roaman on 4/5/25.
//

import UIKit

// MARK: Comparisons
public extension UIColor {
    func hasSameRGB(as otherColor: UIColor) -> Bool {
        var thisR: CGFloat = 0
        var thisG: CGFloat = 0
        var thisB: CGFloat = 0
        self.getRed(&thisR, green: &thisG, blue: &thisB, alpha: nil)

        var otherR: CGFloat = 0
        var otherG: CGFloat = 0
        var otherB: CGFloat = 0
        otherColor.getRed(&otherR, green: &otherG, blue: &otherB, alpha: nil)

        return  (thisR == otherR) && (thisG == otherG) && (thisB == otherB)
    }
    
    func hasSameRGBA(as otherColor: UIColor) -> Bool {
        var thisR: CGFloat = 0
        var thisG: CGFloat = 0
        var thisB: CGFloat = 0
        var thisA: CGFloat = 0
        self.getRed(&thisR, green: &thisG, blue: &thisB, alpha: &thisA)

        var otherR: CGFloat = 0
        var otherG: CGFloat = 0
        var otherB: CGFloat = 0
        var otherA: CGFloat = 0
        otherColor.getRed(&otherR, green: &otherG, blue: &otherB, alpha: &otherA)

        return  (thisR == otherR) && (thisG == otherG) && (thisB == otherB) && (thisA == otherA)
    }
}

// MARK: Adjustments
public extension UIColor {
    func darkened(by amount: CGFloat) -> UIColor {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        // This sets red, green, blue, and alpha as values btwn 0.0 and 1.0 (representing a % of 255)
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let change = amount/255
        
        let newRed = red - change
        let newGreen = green - change
        let newBlue = blue - change
        
        let usableRed = newRed >= 0 ? newRed : 0
        let usableGreen = newGreen >= 0 ? newGreen : 0
        let usableBlue = newBlue >= 0 ? newBlue : 0
        
        return UIColor(red: usableRed, green: usableGreen, blue: usableBlue, alpha: alpha)
    }
    
    func lightened(by amount: CGFloat) -> UIColor {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        // This sets red, green, blue, and alpha as values btwn 0.0 and 1.0 (representing a % of 255)
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let change = amount/255
        
        let newRed = red + change
        let newGreen = green + change
        let newBlue = blue + change
        
        let usableRed = newRed <= 1 ? newRed : 1
        let usableGreen = newGreen <= 1 ? newGreen : 1
        let usableBlue = newBlue <= 1 ? newBlue : 1
        
        return UIColor(red: usableRed, green: usableGreen, blue: usableBlue, alpha: alpha)
    }
}

// MARK: Hex
public extension UIColor {
    static func fromHex(_ hex: String?) -> UIColor {
        guard let hex = hex else { return .white }
        var colorString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if colorString.hasPrefix("#") {
            colorString.remove(at: colorString.startIndex)
        }

        guard colorString.count == 6 else {
            return .white
        }

        var rgbValue:UInt64 = 0
        Scanner(string: colorString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    var asHex: String? {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        // This sets red, green, blue, and alpha as values btwn 0.0 and 1.0 (representing a % of 255)
        guard getRed(&red, green: &green, blue: &blue, alpha: &alpha) else { return nil }
        
        if alpha == 1.0 {
            return String(format: "#%02lX%02lX%02lX", Int(red * 255), Int(green * 255), Int(blue * 255))
        } else {
            return String(format: "#%02lX%02lX%02lX%02lX", Int(red * 255), Int(green * 255), Int(blue * 255), Int(alpha * 255) )
        }
    }
    
    var asHexNoHash: String? {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        // This sets red, green, blue, and alpha as values btwn 0.0 and 1.0 (representing a % of 255)
        guard getRed(&red, green: &green, blue: &blue, alpha: &alpha) else { return nil }
        
        if alpha == 1.0 {
            return String(format: "%02lX%02lX%02lX", Int(red * 255), Int(green * 255), Int(blue * 255))
        } else {
            return String(format: "%02lX%02lX%02lX%02lX", Int(red * 255), Int(green * 255), Int(blue * 255), Int(alpha * 255) )
        }
    }
}

// MARK: Lumosity/Relative Colors
public extension UIColor {
    // https://stackoverflow.com/questions/3942878/how-to-decide-font-color-in-white-or-black-depending-on-background-color
    // https://www.w3.org/TR/WCAG20/#relativeluminancedef
    // https://en.wikipedia.org/wiki/Luma_(video)#Rec._601_luma_versus_Rec._709_luma_coefficients
    // NOTE: This algorithm does not account for alpha
    private static var contrastThreshold: CGFloat { 0.19 }
    
    var contrastingMonoColor: UIColor {
        // 0.179 is the recommended threshold, but I think 0.19 performs a bit better - {Ben R, 2020-10-13}
        return relativeLuminance > Self.contrastThreshold ? .black : .white
    }
    
    var contrastingStandardTextColor: UIColor {
        .label.resolvedColor(with: .init(userInterfaceStyle: relativeLuminance > Self.contrastThreshold ? .light : .dark))
    }
    
    var relativeLuminance: CGFloat {
        // Constants
        let redCoefficient: CGFloat = 0.2126
        let greenCoefficient: CGFloat = 0.7152
        let blueCoefficient: CGFloat = 0.0722
        
        // Algorithm
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        // This sets red, green, blue, and alpha as values btwn 0.0 and 1.0 (representing a % of 255)
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let redLuma = getLuma(for: red)
        let greenLuma = getLuma(for: green)
        let blueLuma = getLuma(for: blue)
        
        return (redLuma * redCoefficient) + (greenLuma * greenCoefficient) + (blueLuma * blueCoefficient)
    }
    
    func getContrastingBorderColor(for style: UIUserInterfaceStyle) -> UIColor {
        let blackBorderThreshold: CGFloat = 0.7230551289219693
        let whiteBorderThreshold: CGFloat = 0.026241221894849894
        let luminance = relativeLuminance
        
        switch style {
        case .light: return luminance >= blackBorderThreshold ? .black : self
        case .dark: return luminance <= whiteBorderThreshold ? .white : self
        case .unspecified: return self
        @unknown default: return self
        }
    }
    
    func needsBorderForContrast(for style: UIUserInterfaceStyle) -> Bool {
        let blackBorderThreshold: CGFloat = 0.7230551289219693
        let whiteBorderThreshold: CGFloat = 0.026241221894849894
        let luminance = relativeLuminance
        
        switch style {
        case .light: return luminance >= blackBorderThreshold ? true : false
        case .dark: return luminance <= whiteBorderThreshold ? true : false
        case .unspecified: return false
        @unknown default: return false
        }
    }
    
    func getContrastingBorderColorForDarkBackground() -> UIColor { getContrastingBorderColor(for: .dark) }
    func getContrastingBorderColorForLightBackground() -> UIColor { getContrastingBorderColor(for: .light) }
    
    private func getLuma(for component: CGFloat) -> CGFloat {
        // Expects a value between 0.0 and 1.0 (representing a % of 255)
        
        // Constants
        let lumaThreshold: CGFloat = 0.03928
        let lumaSubThresholdDenominator: CGFloat = 12.92
        let lumaSuperThresholdConstant: CGFloat = 0.055
        let lumaSuperThresholdDenominator: CGFloat = 1.055
        let lumaSuperThresholdExponent: CGFloat = 2.4
        
        if component <= lumaThreshold {
            return component/lumaSubThresholdDenominator
        } else {
            let baseLuma = (component+lumaSuperThresholdConstant)/lumaSuperThresholdDenominator
            return pow(baseLuma, lumaSuperThresholdExponent)
        }
    }
}

