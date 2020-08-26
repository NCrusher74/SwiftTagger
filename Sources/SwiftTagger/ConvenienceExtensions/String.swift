//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 8/24/20.
//

import Foundation

extension String {
    /// Convenience Extension. Divides string in components separated by `"; "`
    var toArray: [String] {
        return self.components(separatedBy: "; ")
    }
}

extension Array where Element == String {
    /// Convenience extension. Joins array into string with components separated by `"; "`
    var toString: String {
        return self.joined(separator: "; ")
    }
}
