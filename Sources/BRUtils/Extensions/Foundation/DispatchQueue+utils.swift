//
//  DispatchQueue+utils.swift
//
//
//  Created by Ben Roaman on 3/21/25.
//

import Foundation

extension DispatchQueue {
    class func asyncOnMain(_ task: @escaping () -> Void) {
        Thread.isMainThread ? task() : main.async { task() }
    }
    
    class func syncOnMain(_ task: @escaping () -> Void) {
        Thread.isMainThread ? task() : main.sync { task() }
    }
}
