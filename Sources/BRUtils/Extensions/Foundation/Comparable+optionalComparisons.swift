//
//  File.swift
//  
//
//  Created by Ben Roaman on 3/21/25.
//

import Foundation

infix operator ?> : ComparisonPrecedence
infix operator ?>= : ComparisonPrecedence
infix operator ?< : ComparisonPrecedence
infix operator ?<= : ComparisonPrecedence
infix operator ?== : ComparisonPrecedence
infix operator ?!= : ComparisonPrecedence

extension Comparable {
    static func ?>(lhs: Self?, rhs: Self) -> Bool {
        guard let lhs = lhs else { return false }
        return lhs > rhs
    }
    
    static func ?>=(lhs: Self?, rhs: Self) -> Bool {
        guard let lhs = lhs else { return false }
        return lhs >= rhs
    }
    
    static func ?<(lhs: Self?, rhs: Self) -> Bool {
        guard let lhs = lhs else { return false }
        return lhs < rhs
    }
    
    static func ?<=(lhs: Self?, rhs: Self) -> Bool {
        guard let lhs = lhs else { return false }
        return lhs <= rhs
    }
    
    static func ?==(lhs: Self?, rhs: Self) -> Bool {
        guard let lhs = lhs else { return false }
        return lhs == rhs
    }
    
    static func ?!=(lhs: Self?, rhs: Self) -> Bool {
        guard let lhs = lhs else { return false }
        return lhs != rhs
    }
}

extension Equatable {
    static func ?==(lhs: Self?, rhs: Self) -> Bool {
        guard let lhs = lhs else { return false }
        return lhs == rhs
    }
    
    static func ?!=(lhs: Self?, rhs: Self) -> Bool {
        guard let lhs = lhs else { return false }
        return lhs != rhs
    }
}
