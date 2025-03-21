//
//  RawRepresentable+utils.swift
//
//
//  Created by Ben Roaman on 3/21/25.
//

import Foundation

extension RawRepresentable {
    init?(_ raw: RawValue?) {
        guard let raw = raw else { return nil }
        self.init(rawValue: raw)
    }
}
