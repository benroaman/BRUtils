//
//  File.swift
//  
//
//  Created by Ben Roaman on 3/21/25.
//

import Foundation

public extension Double {
    func rounded(to places: UInt8) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
