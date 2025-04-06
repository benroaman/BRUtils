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

public extension Comparable {
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

public extension Equatable {
    static func ?==(lhs: Self?, rhs: Self) -> Bool {
        guard let lhs = lhs else { return false }
        return lhs == rhs
    }
    
    static func ?!=(lhs: Self?, rhs: Self) -> Bool {
        guard let lhs = lhs else { return false }
        return lhs != rhs
    }
}
