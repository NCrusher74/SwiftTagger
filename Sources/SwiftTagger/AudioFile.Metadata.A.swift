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
            switch library {
                case .mp4:
                    if let value = self.mp4Tag.acknowledgment {
                    return value
                } else { return nil }
                case .id3:
                    if let value = self.id3Tag[userDefinedText: "Acknowledgment"] {
                    return value
                } else { return nil }
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .mp4:
                        self.mp4Tag.acknowledgment = new
                    case .id3:
                        self.id3Tag[userDefinedText: "Acknowledgment"] = new
                }
            } else {
                switch library {
                    case .mp4:
                        self.mp4Tag.acknowledgment = nil
                    case .id3:
                        self.id3Tag[userDefinedText: "Acknowledgment"] = nil
                }
            }
        }
    }
}
