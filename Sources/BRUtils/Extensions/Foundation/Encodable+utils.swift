//
//  File.swift
//  
//
//  Created by Ben Roaman on 3/21/25.
//

import Foundation

public extension Encodable {
    var asJsonString: String? {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(self)
            return String(data: data, encoding: .utf8)
        } catch {
            return nil
        }
    }
}
