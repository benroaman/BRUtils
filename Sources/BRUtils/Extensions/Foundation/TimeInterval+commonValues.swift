//
//  File.swift
//  
//
//  Created by Ben Roaman on 3/21/25.
//

import Foundation

public extension TimeInterval {
    static var secondsInAnHour: Double { 3600 } // 60*60
    static var secondsInADay: Double { 86400 } // 60*60*24
    static var secondsInAWeek: Double { 604800 } // 60*60*24*7
    static var roughSecondsInAMonth: Double { 2592000 } // 60*60*24*30
    static var roughSecondsInAYear: Double { 31536000 } // 60*60*24*365
}
