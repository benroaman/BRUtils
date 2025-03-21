//
//  Float+utils.swift
//  
//
//  Created by Ben Roaman on 3/21/25.
//

import Foundation

extension Float {
    func rounded(to places: UInt8) -> Float {
        let divisor = pow(10.0, Float(places))
        return (self * divisor).rounded() / divisor
    }
}
