//
//  Equatable+utils.swift
//  
//
//  Created by Ben Roaman on 3/21/25.
//

import Foundation

extension Equatable {
    // Returns true if self is equal to any of the arguments
    // turns (flip == flop || flip == flüp || flip == flap || flip == flep)
    // into
    // flip.any(flop, flüp, flap, flep)
    func any(_ args: Self...) -> Bool {
        for arg in args {
            if self == arg { return true }
        }
        
        return false
    }
    
    func any(_ args: [Self]) -> Bool {
        for arg in args {
            if self == arg { return true }
        }
        
        return false
    }
    
    func none(_ args: Self...) -> Bool { !any(args) }
    func none(_ args: [Self]) -> Bool { !any(args) }
}

extension Equatable where Self: Hashable {
    func any(_ args: Set<Self>) -> Bool { args.contains(self) }
    func none(_ args: Set<Self>) -> Bool { !any(args) }
}
