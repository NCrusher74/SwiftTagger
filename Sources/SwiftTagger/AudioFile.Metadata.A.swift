//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 8/15/20.
//
import SwiftTaggerID3
import SwiftTaggerMP4
import Foundation

@available(OSX 10.13, *)
extension AudioFile {
    
    var acknowledgment: String? {
        get {
            if let value = self.get(.acknowledgment) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.acknowledgment, stringValue: newValue)
        }
    }
    
    var album: String? {
        get {
            if let value = self.get(.album) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.album, stringValue: newValue)
        }
    }

}
