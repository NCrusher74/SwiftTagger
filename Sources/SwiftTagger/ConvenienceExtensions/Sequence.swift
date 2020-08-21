//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 8/20/20.
//

import Foundation

public extension Sequence where Element: BinaryInteger {
    
    func hexadecimal() -> String {
        return lazy.map({ String($0, radix: 16) }).joined(separator: " ")
    }
}
