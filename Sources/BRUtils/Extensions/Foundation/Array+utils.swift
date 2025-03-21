//
//  Array+utils.swift
//
//
//  Created by Ben Roaman on 3/21/25.
//

import Foundation

public extension Array {
    func get(_ index: Int?) -> Element? {
        guard let i = index else { return nil }
        guard i >= 0 && i < count else { return nil }
        return self[i]
    }
    
    mutating func replace(_ index: Int, with element: Element) {
        guard index >= 0 && index < count else { return }
        self[index] = element
    }
    
    mutating func appendOptional(_ element: Element?) {
        if let unwrapped = element { append(unwrapped) }
    }
}
